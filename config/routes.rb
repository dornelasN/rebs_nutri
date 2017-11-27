Rails.application.routes.draw do
  root 'static_pages#home'
  get     '/about',    to: 'static_pages#about'
  #get     '/contact',  to: 'static_pages#contact'
  get     '/contact',  to: 'messages#new', as: 'contact'
  post    '/contact',  to: 'messages#create'
  get     '/signup',   to: 'users#new'
  post    '/signup',   to: 'users#create'
  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  resources :users #endows the application with all the actions needed for a RESTful Users Resouce
  
  # create a named RESTful route for the EDIT action: 
  # HTTP request: GET, URL: /account_activation/<token>/edit, Action: EDIT
  # named RESTful route: edit_account_activation_url(token)
  resources :account_activations, only: [:edit] 

  # Need forms for creating new password resets and for updating them by changing the password
  # in the user model. So create routes for new, create, edit, and update through resources. 
  # HTTP REQUEST - URL - ACTION - NAMED ROUTE 
  # GET - /password_resets/new - new - new_password_reset_path
  # POST - /password_resets/create - create - create_password_reset_path
  # GET - /password_resets/<token>/edit - edit - edit_password_reset_path(token)
  # POST - /password_resets/<token> - update - update_password_reset_url(token)
  resources :password_resets, only: [:new, :create, :edit, :update]

  # Interface to the Diets resource will run mainly through Profile and Home pages
  # so there is only need for the create and destroy actions in the Diets controller
  # POST - /diets - create - diets_path
  # DELETE - /diets/1 - destroy - diet_path(diet)
  resources :diets, only: [:create, :destroy]
end
