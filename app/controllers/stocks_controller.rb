class StocksController < ApplicationController
  require 'json'
  require 'ostruct'
  def stock
    if params[:stock_transaction]
      # Redirect to show the newly created record, for example.
      change = params[:transaction]
      tick = params[:ticker]
      if Userstock.exists?(:ticker => tick, :user_id => session[:user_id])
        Userstock.where(:ticker => tick).where(:user_id => session[:user_id]).update_all("quantity = " + change)
      else
        Userstock.create(:ticker => tick, :quantity => change, :user_id => session[:user_id])
      end
      redirect_to :back, :alert => "Transaction Happened! " + change + " " + tick + " "
    else
      # Redirect to new form, for example.
      begin
        #get stocks from yahoo into data, chart info is for the interactive chart
        yahoo_client = YahooFinance::Client.new
        #this is the stock you will get
        @stock = params[:ticker]
        @_current_user ||= session[:user_id] &&
            User.find_by(id: session[:user_id])
        if( params.has_key?(:ticker))
          chart = yahoo_client.historical_quotes(@stock, { start_date: Time::now-(24*60*60*30), end_date: Time::now })
          data = yahoo_client.quote([@stock], [:ask, :high, :low, :high_52_weeks, :low_52_weeks, :close, :name], {raw: false})
          #set everything that you will be using on the page
          @ask = data.ask
          @high = data.high
          @low = data.low
          @high52 = data.high_52_weeks
          @low52 = data.low_52_weeks
          @close = data.close
          @name = data.name
          dates = []
          values = []
          chart.each do |this|
            dates.unshift(this[:trade_date].to_date)
            values.unshift(this[:close].to_f)
          end
        else
          @ask = 'N/A'
          @high= 'N/A'
          @low= 'N/A'
          @high52 = 'N/A'
          @low52 = 'N/A'
          @close = 'N/A'
          @name = 'Please Enter A Valid Ticker'
          @stock = 'N/A'
        end
        @show = LazyHighCharts::HighChart.new('graph') do |f|
          f.title(:text => @name)
          f.xAxis(:categories => dates, :type => 'datetime')
          f.series(:name => "Closing Value", :yAxis => 0, :data => values)
          f.yAxis [
                      {:title => {:text => "Value in Dollars"}}
                  ]
          f.chart({:defaultSeriesType=>"line", :zoomType => "x"})
          f.plotOptions({
                            area: {
                                fillColor: {
                                    linearGradient: {
                                        x1: 0,
                                        y1: 0,
                                        x2: 0,
                                        y2: 1
                                    }
                                },
                                marker: {
                                    radius: 2
                                },
                                lineWidth: 1,
                                states: {
                                    hover: {
                                        lineWidth: 1
                                    }
                                }
                            }
                        })
        end
      rescue OpenURI::HTTPError => ex
        flash[:alert] = "That is not a valid ticker symbol!"
        redirect_to :back, :alert => "That is not a valid ticker symbol!"
      end
    end
  end
  def index
    #for now we'll get them here
    @userstocks = Userstock.all
  end
end