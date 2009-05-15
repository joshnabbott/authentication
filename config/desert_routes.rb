resource :account, :controller => 'users'
resource :user_session
resources :users, :except => [ :index ]