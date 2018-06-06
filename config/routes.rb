Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root to: "toppages#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show]
  
  resources :frames
  
end
