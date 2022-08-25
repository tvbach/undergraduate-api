Rails.application.routes.draw do
  post 'login', to: 'sessions#login'

  get 'categories', to: 'categories#index'
end
