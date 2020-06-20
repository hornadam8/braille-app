Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"

  resources :sessions, only: [:new,:create]

  resources :users, only: [:new,:create,:show] do
    resources :roles, only: [:index]
  end
end
