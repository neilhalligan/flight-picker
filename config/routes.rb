Rails.application.routes.draw do
  root to: 'flights#index'
  get "/about", to: "static_pages#about"
  get "/help", to: "static_pages#help"
  resources :bookings, only: [:new, :create, :show]
  resources :charges, only: [:new, :create]
end
