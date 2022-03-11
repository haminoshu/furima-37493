Rails.application.routes.draw do
  devise_for :users

   root to: "items#index"
  #  get 'items', to: 'items#index'

  resources :items do
    resources :buys, only: [:index, :new, :create]
  end

end
