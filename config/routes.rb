# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    # TODO: Resource routes go in here
    resources :configs
    resources :transactions
    resources :receiver_accounts

    resources :users, only: %i[create show]
    post '/login',    to: 'sessions#create'
    post '/logout',   to: 'sessions#destroy'
    get '/logged_in', to: 'sessions#is_logged_in?'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
