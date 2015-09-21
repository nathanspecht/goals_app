Rails.application.routes.draw do
  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
end
