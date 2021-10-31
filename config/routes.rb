Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home"

  get "/home", to: "home#home", as: :home
  get "/notes", to: "notes#notes"
  get "/websites", to: "websites#websites"
  get "/cms", to: "cms#cms", as: :cms
  resources :tickets
  resources :subjects
  resources :categories
  resources :languages
  resources :members

  devise_for :users
end
