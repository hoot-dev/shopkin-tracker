Rails.application.routes.draw do
  resources :shopkins, only: [:index, :show]

  root 'shopkins#index'
end
