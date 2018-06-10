Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/index'

  get 'users/show'

  root to: "frames#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show] do
    member do
      get :interest
      get :visit
    end
  end
  
  resources :frames
  resources :relationships, only: [ :create, :destroy ]
  
end
