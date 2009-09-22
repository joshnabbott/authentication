with_options(:path_prefix => 'authentication') do |authentication|
  authentication.resource :account, :controller => 'users'
  authentication.resource :user_session
  authentication.resources :users, :except => [ :index ]
end