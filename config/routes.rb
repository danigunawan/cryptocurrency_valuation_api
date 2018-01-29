Rails.application.routes.draw do

  resources :tracked_currencies, only: [:index, :create, :update, :destroy], path: 'tracked', param: :symbol do
    get 'ids', on: :collection
  end
  resources :currencies, only: [:index] do
    post 'batch_update', on: :collection
  end
  resources :valuation_settings, only: [:index, :create, :update, :destroy], path: 'valuation-settings'
  resources :assets, only: [:index, :create, :update, :destroy], param: :symbol
  resources :valuations, only: [:update]
  resources :status, only: [:index]
  resources :users, only: [:create, :update]

  post 'login', to: 'auth#create', as: :login
  get 'logout', to: 'auth#destroy', as: :logout
end
