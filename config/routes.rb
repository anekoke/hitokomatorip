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
  
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
  
end
