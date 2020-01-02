Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "static_pages#index"
  
  get "/about", to: "static_pages#about"
  resources :users
  resources :news, only: %i(index show)
  resources :services, only: %i(index show)
end
