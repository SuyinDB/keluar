Rails.application.routes.draw do
  
  # specific URL for omniauth
	get "auth/:provider/callback" => "social_logins#create"

  resources :users

  resources :tasks do
  	resources :pitches
  end

  resource :session

  root "tasks#index"

end