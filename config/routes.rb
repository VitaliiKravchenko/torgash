Rails.application.routes.draw do

  get 'forgot_passwords/new'

  get 'forgot_passwords/create'

  resources :microposts
  resources :products
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
#  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions
  resource :home, only: [:show]

  delete "log_out" => "sessions#destroy"#, :as => "log_out"
  get "log_in" => "sessions#new"
  post "log_in" => "sessions#create"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "products#index"

  resources :users
  
  get 'forgot_passwords', to: 'forgot_passwords#new'
  resources :forgot_passwords, only: [:create]
  resources :password_resets, only: [:show, :create]
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  get 'expired_token', to: 'password_resets#expired_token'

  resources :conversations do
    resources :messages
  end
  get "angular_test", to: "angular_test#index"
#  get '*unmatched_route', to: 'application#record_not_found'
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
