BridgelyApi::Application.routes.draw do

  namespace :v1 do
    # devise_for :users, :class_name => "V1::Admin::User", :path => 'auth'
    resources :questions, except: [:new, :edit]
    resources :messages, except: [:new, :edit]
    resources :employees, except: [:new, :edit]
  end

  namespace :v1 do
    namespace :admin do
      devise_for :users, :class_name => "V1::Admin::User", :skip => :all
      resources :users, except: [:new, :edit]
      resources :companies, except: [:new, :edit]
    end
  end

  match '*all' => 'application#cors', via: [:options], format: false

  #root :to => "v1/sessions#new"
  post "/v1/auth/login"    => "v1/sessions#create"
  delete "/v1/auth/logout" => "v1/sessions#destroy"



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
