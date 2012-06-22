Ideahub::Application.routes.draw do

  
  scope '/feathers' do
    match 'page/:type/(:status)' => 'feathers#page', :as => :feather_page
    get 'pages' => 'feathers#index', :as => :feather_pages
    get 'preivew/:type/(:status)' => 'feathers#preivew', :as => 'feather_page_preview'
  end
  get 'page/:type' => 'feathers#published', :as => 'feather_published_page'


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
