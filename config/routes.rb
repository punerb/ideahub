Ideahub::Application.routes.draw do

  # Omniauth
  match "/signin" => redirect("/auth/twitter"), :as => :signin_services
  match "/signout" => "services#signout"
  
  match '/auth/:service/callback' => 'services#create' 
  match '/auth/failure' => 'services#failure'

  resources :ideas do
    get 'participate', :on => :member
  end
  resources :schedules
  
  # used for the demo application only
  resources :users, :only => [:index] do
  end
   
  root :to => 'welcome#index'
end
