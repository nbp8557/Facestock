source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

gem 'puma'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.18'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


gem 'yahoo-finance'
gem 'lazy_high_charts'

#calendar
gem 'momentjs-rails'
gem 'fullcalendar-rails'
gem 'jquery-ui-rails'
#makes jquery work
gem 'rails_12factor', group: :production

gem 'underscore-rails'
gem 'clndr-rails'

# Facebook
gem 'omniauth-facebook'
gem "koala", "~> 2.2"

gem 'pg', group: [:production, :staging]

#Windows compatibility
#gem 'nokogiri', '1.6.7.rc3'
#gem 'tzinfo-data'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'

  #RSpec is used for unit testing
  #gem 'rspec-rails', '~> 3.0'

  #Used for doing coverage testing on our application
  gem 'simplecov', require: false

end

group :development do


  #Use the following gems for Debuging
  gem 'better_errors', '1.0.1'
  gem 'binding_of_caller', '0.7.2'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
