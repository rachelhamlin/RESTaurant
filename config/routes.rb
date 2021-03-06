Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :employees, only: [:new, :create]
  resources :parties, only: [:current, :history, :new]
  resources :items

  get '/employees/log_in' => "employees#log_in", as: :log_in
  get '/employees/profile' => "employees#profile", as: :profile

  get '/admin/menu' => "items#index"
  get '/admin/employees'  => "employees#index"

  # post '/items/new' => "items#new"
  # get '/items/:id' => "items#show"
  # put '/items/:id' => "items#edit"

  get '/parties' => "parties#current"
  get '/parties/:id' => "orders#new", as: :order
  post '/parties/:id' => "orders#create"
  put '/parties/:id' => "parties#update", as: :party
  post '/parties' => "parties#create"
  get '/history' => "parties#history"

  post '/sessions' => "sessions#create", as: :new_session
  delete '/sessions' => "sessions#destroy", as: :delete_session

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
end
