Rails.application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"

  devise_for :users, controllers: {
    sessions: 'sessions/sessions', registrations: 'sessions/registrations'
  }

  get 'admin/index'

  get 'reload_posts', to: 'posts#reload_posts'

  root 'main#index'

  post 'add_user/:neighborhood_id', to: 'neighborhoods#add_user'
  post 'neighborhoods/:id/remove_user/:user_id', as: 'remove_user', to: 'neighborhoods#remove_user'

  resources :posts do
    member do
      post 'upvote'
      post 'downvote'
      post 'update_category'
    end
  end

  post 'comment/:post_id', to: 'comments#create', as: 'create_comment'

  resources :requests do
    member do
      post 'approve', to: 'requests#approve'
    end
  end
  resources :neighborhoods do
    member do
      post 'set_active', to: 'neighborhoods#set_active'
      post 'request_to_join', to: 'neighborhoods#request_to_join'
      post 'leave', to: 'neighborhoods#leave'
    end
  end
  resources :categories
  resources :comments, except: [:create, :destroy] do
    member do
      delete 'delete', to: 'comments#destroy'
    end
  end
  resources :events
  resources :messages
  resources :groups
  resources :users
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
