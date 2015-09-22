Rails.application.routes.draw do
  resource :user, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :comments, only: [:create, :destroy]
  root 'sessions#new'
end
