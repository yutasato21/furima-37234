Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products do
    resources :purchase, only: [:index, :create]
  end
end