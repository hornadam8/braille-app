Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#home"

  get "/logout", to: "sessions#logout"

  resources :sessions, only: [:new,:create]

  resources :users, only: [:new,:create,:show]

  resources :user_roles, only: [:new,:create]

  resources :cohorts, only: [:new,:create,:show,:index,:edit,:update,:destroy] do
    resources :assignments, only: [:new,:create,:show,:index,:edit,:update,:destroy]
    resources :user_cohorts, only: [:new,:create]
  end


end
