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
  resources :reviews, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :requests, only: [:create, :destroy]

  namespace :admin do
    resources :users, except: [:new, :create]
    resources :categories
    resources :books
  end
end
