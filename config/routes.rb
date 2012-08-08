Jobster::Application.routes.draw do
  
  resources :friendships, :memberships, :comments, :likes, :requests, :profiles, :preferences, :jobs, :interviews, :searches, :watches, :blocks
  
  resources :posts, :only => [:create, :destroy] do 
  	resources :comments
  	resources :likes
  end 

  resources :applications do 
    collection do 
      get :all
      get :applied
      get :interview
      get :declined
    end    
  end
  resources :applications
  resources :profiles do 
  	resources :abouts
  	resources :preferences  	
    resources :educations
  	resources :experiences
  	resources :competencies
  	resources :languages
  	resources :references
    resources :publications
  end

  resources :user, :only => [:create, :delete] do    
    get :profile, :on => :collection
    resources :applications
    resources :interviews
    resources :jobs 
    resources :watches
    resources :blocks
    resources :addresses
    resources :identifiers
    resources :messengers
    resources :websites
    resource :profile do
      resources :abouts
      resources :preferences    
      resources :educations
      resources :experiences
      resources :competencies
      resources :languages
      resources :references
      resources :publications
      resources :addresses
      resources :identifiers
      resources :messengers
      resources :websites
    end  
  end
  	
  get "home/show"
  get "home/landing"
  
  resources :activities do 
  	resources :comments
  	resources :likes
  end
  
  resources :statuses do 
  	resources :comments
  	resources :likes
  end
  
  resources :pages do 
  	resources :comments
  	resources :likes
  end
  
  resources :users do
  	#get :profile, :on => :collection  
  	get :change_profile, :on => :collection 
  	resources :pages
    resources :applications
  end
  
  resources :events do
  	get :add, :on => :collection
  	put :assistance, :on => :collection
  	#post :page, :on => :collection
  	resources :pages
  end 	
  
  resources :groups do     
  	resources :pages
  end
  
  resources :messages do 
  	collection do 
  	  get :all
  	  get :inbox
  	  get :sentbox
  	  get :trash
  	end
  	resources :replies
  end
  
  resources :jobs do
    resources :applications
  end  

  resources :applications do
    resources :interviews
  end  
  resources :applications
  devise_for :users do
    get "/login", :to => "devise/sessions#new"
    get "/logout", :to => "devise/sessions#destroy"
    get "/register", :to => "registrations#new"
  end
  
  match '/user/:username',
            :controller => 'users',
            :action => 'show_by_username' 
  
  match '/pages',
            :controller => 'pages',
            :action => 'index' 
            
  match '/contacts' => "contacts#contacts"
  
  match 'contacts/:id' => "contacts#contacts_user"
  
  match 'request/:user_id' => "requests#send_request"                                              
  match 'requests/pending' => "requests#pending"
  match 'user/:username/profile' => "profiles#show"
  match 'user/:username/profile/create' => "profiles#new"   
            
  root :to => "home#show"            

  #match ':controller(/:action(/:id(.:format)))'
end
