Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home"

  get "/home", to: "home#home", as: :home
  get "/notes", to: "notes#notes"
  get "/cms", to: "cms#cms", as: :cms
  resources :tickets
  resources :feature_types
  resources :features
  resources :settings
  resources :collections
  get "/set_collection/:id", to: "collections#set_collection", as: :set_collection

  devise_for :users
end
