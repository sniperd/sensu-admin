SensuAdmin::Application.routes.draw do
  devise_for :users

  namespace :users do
    scope '/:id' do
      put 'update_password'
      put 'activate'
    end
  end

  # If someone can DRY these up properly, please do
  match '/events/events_table' => 'events#events_table', :via => :get
  match '/events/modal_data' => 'events#modal_data', :via => :get
  match '/events/:client/:check/resolve' => 'events#resolve', :via => :post, :id => /[A-Za-z0-9\.]+?/
  match '/events/:client/silence' => 'events#silence_client', :via => :post, :id => /[A-Za-z0-9\.]+?/
  match '/events/:client/:check/silence' => 'events#silence_check', :via => :post, :id => /[A-Za-z0-9\.]+?/
  match '/events/:client/unsilence' => 'events#unsilence_client', :via => :post, :id => /[A-Za-z0-9\.]+?/
  match '/events/:client/:check/unsilence' => 'events#unsilence_check', :via => :post, :id => /[A-Za-z0-9\.]+?/

  namespace :stashes do
    post 'create_stash'
    post 'delete_stash'
    post 'delete_all_stashes'
  end

  namespace :downtimes do
    get 'old_downtimes'
    post 'force_complete'
  end

  match 'checks/:check/submit' => 'checks#submit_check', :via => :post

  namespace :api do
    get 'status'
    get 'time'
    get 'setup'
    post 'test_api'
  end

  match "settings/missing" => "settings#missing", :via => :get

  resources :events
  resources :stashes
  resources :logs
  resources :checks, :id => /.*/
  resources :downtimes
  resources :clients, :id => /.*/
  resources :users
  resources :stats
  resources :aggregates
  resources :settings

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
  root :to => 'events#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
