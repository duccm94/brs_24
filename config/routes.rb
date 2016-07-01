Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :books, only: [:index, :show]
  resources :reviews
  resources :comments
  resources :requests, only: [:index, :create, :destroy]
  resources :activities, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :categories
    resources :books
    resources :requests, only: [:index, :update, :destroy]
  end
end
