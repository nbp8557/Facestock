Rails.application.routes.draw do
  root 'welcome#index'

  # Example of regular route:
  get 'login' => 'login#index'
  post 'feed' => 'facebook#feed'
  post 'status' => 'facebook#status'

  # Facebook callback
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'stocks/stock'

end
