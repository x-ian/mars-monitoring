MarsMonitoring::Application.routes.draw do
  get "visualize/d3_example_lines"
  get "visualize/d3_example_zoom"
  get "visualize/d3_single_probe"
  get "visualize/d3_data"

  resources :probe_configurations

  resources :value_types

  resources :probe_statuses

  resources :events

  resources :communication_channels

  resources :probe_types

  resources :invalid_messages

  resources :probes_probe_status_configrations

  resources :probe_status_configurations

  get "dashboard/show"

  resources :user_service_classifications

  resources :message_types

  resources :user_locations

  resources :service_classifications

  resources :users

  resources :locations

  resources :customers

  resources :messages

  match "messages/create_from_probe", :via => [:post]
  
  match "messages/create_from_probe_with_server_time", :via => [:post]
  
  resources :probes

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
