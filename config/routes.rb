Rails.application.routes.draw do

  match 'questions/index', :to => 'questions#index' ,:via => :get
  match 'questions/new', :to => 'questions#new' ,:via => :get
  match 'questions/add', :to => 'questions#add' ,:via => :post   
  match 'questions/delete', :to => 'questions#delete' ,:via => :get   
  match 'questions/q_delete', :to => 'questions#q_delete' ,:via => :get   
  match 'questions/q_update', :to => 'questions#q_update' ,:via => :get   
  match 'questions', :to => 'questions#create' ,:via => :post   
  match 'questions/login', :to => 'questions#login' ,:via => :get
  match 'questions/auth', :to => 'questions#auth' ,:via => :post   
  match 'questions/regist', :to => 'questions#regist' ,:via => :post   
  match 'questions/logout', :to => 'questions#logout' ,:via => :get   
  match 'questions/output_csv', :to => 'questions#output_csv' ,:via => :get   
    
    
  get 'tweets/index'
  get 'tweets/show'
  get 'tweets/new'
  post 'tweets' => 'tweets#create' 


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
end
