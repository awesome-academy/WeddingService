Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "users/registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "static_pages#index"
  
  get "/about", to: "static_pages#about"
  resources :users
  resources :news, only: %i(index show)
end
