Rails.application.routes.draw do
  get 'static_pages/help'

  get 'static_pages/about'

  root to: 'flights#index'
  resources :bookings, only: [:new, :create, :show]
  get "/about", to: "static_pages#about"
  get "/help", to: "static_pages#help"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
