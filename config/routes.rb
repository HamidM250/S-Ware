SPCA::Application.routes.draw do

  #get "users/new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  #root :to => "users#new"
  resources :users
  resources :sessions

  resources :orientations

  get "help/volunteer"
  get "help/foster"
  get "help/coordinator"

#  get "fosterer/index"
  resources :fosterers

  resources :notepads

  resources :volunteers do
    resources :whiteboards
  end
  resources :whiteboards
  resources :volcoordinators
  
  #get "volcoordinator/:reviewtype", to: 'volcoordinators#showvolunteers'
  #^ doesn't work because volcoordinator is is a class, rather than just a page
  #it is getting confused with the get "volcoordinator/:id", to: 'volcoordinators#show'
  #route generated from resources :volcoordinators
  
  get "volcoordinator/newvolunteers", to: 'volcoordinators#newvolunteers'
  get "volcoordinator/orientedvolunteers", to: 'volcoordinators#orientedvolunteers'
  get "volcoordinator/volunteersforshelterbuddy", to: 'volcoordinators#volunteersforshelterbuddy'
  get "volcoordinator/rejectedvolunteers", to: 'volcoordinators#rejectedvolunteers'
  get "volcoordinator/newsupervisor", to: 'volcoordinators#newSupervisor'
  put "volcoordinator/createsupervisor", to: 'volcoordinators#createSupervisor'
  get "volcoordinator/departments", to: 'volcoordinators#departments'
  get "volcoordinator/activeVols", to: 'volcoordinators#activeVols'
  
  get "volcoordinator/:reviewtype/review/:id", to: 'volcoordinators#review'
  post "volcoordinator/:reviewtype/review/:id", to: 'volcoordinators#approve'
  
  resources :upload

#  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  get "home/block"
  get "password" => "users#password", :as => "password"
  put "change_password" => "users#change_password", :as => "change_password"
  #get "users/edit"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
