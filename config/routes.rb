Rails.application.routes.draw do
  resources :messages
  root 'welcome#index'

  # Example of regular route:
  get 'login' => 'login#index'
  get 'feed' => 'facebook#feed'
  post 'status' => 'facebook#status'
  get 'stocks' => 'stocks#index'
  get 'stocks/stock'
  get 'calendar' => 'calendar#index'
  get 'events' => 'events#index'
  get 'downloadMessage' => 'messages#download', :defaults => { :format => 'txt' }

  resources :events

  # Facebook callback
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
