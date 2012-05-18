Ideahub::Application.routes.draw do

  # Omniauth
  match "/signin" => redirect("/auth/twitter")
  match "/signout" => "services#signout"
  
  match '/auth/:service/callback' => 'services#create' 
  match '/auth/failure' => 'services#failure'

  resources :ideas do
    get 'participate', :on => :member
    resources :schedules
  end
  
  # used for the demo application only
  resources :users, :only => [:index] do
  end
   
  root :to => 'welcome#index'
end
