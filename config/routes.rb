Rails.application.routes.draw do
  devise_for :users
  resources :shopkins, only: [:index, :show]

  root to: 'shopkins#index'
end
