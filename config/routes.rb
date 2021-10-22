Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home"

  get "/home", to: "home#home", as: :home_path
  get "/notes", to: "notes#notes"
  get "/websites", to: "websites#websites"

  devise_for :users
end
