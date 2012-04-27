Ideahub::Application.routes.draw do

  # Omniauth
  match "/signin" => redirect("/auth/twitter")
  match "/signout" => "services#signout"
  
  # Omniauth pure
  # Future use
  # match "/signin" => "services#signin"
  # match "/signout" => "services#signout"

  match '/auth/:service/callback' => 'services#create' 
  match '/auth/failure' => 'services#failure'

  resources :ideas do
    get 'participate'
  end
  match '/ideas/:id/participate/:user_id' => 'ideas#participate', :as => :participate
  
  resources :schedules
  resources :services, :only => [:index, :create, :destroy] do
    collection do
      get 'signin'
      get 'signout'
      get 'signup'
      post 'newaccount'
      get 'failure'
    end
  end

  # used for the demo application only
  resources :users, :only => [:index] do
    collection do
      get 'test'
    end
  end
   
  root :to => 'welcome#index'
end
