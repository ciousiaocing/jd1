Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :cart_items

  resources :orders do
    member do
      post :checkout_with_braintree
    end
  end

  namespace :account do
    resources :orders
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :admin do
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

end
