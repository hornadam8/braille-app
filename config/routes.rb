Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"
  get "/set"

  resources :sessions, only: [:new,:create]

  resources :users, only: [:new,:create,:show]

  resources :roles, only: [:index]
end
