Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :cart_items

  resources :orders do
    member do
      post :checkout_with_braintree
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :collections
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :admin do
    resources :categories
    resources :orders do
      member do
        post :ship
        post :delivering
        post :return
        post :refund
      end
    end

    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
  end

  resources :products do
    collection do
      get :search
    end

    member do
      post :add_to_cart
      post :collect
      post :discollect
    end
  end

end
