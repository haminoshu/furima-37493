Rails.application.routes.draw do
  get 'activehashes/index'
  get 'activehashes/new'
  devise_for :users
   root to: "items#index"
  #  get 'items', to: 'items#index'

  resources :items
  resources :activehashes
end
