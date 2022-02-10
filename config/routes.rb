Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    # TODO Resource routes go in here
    resources :configs
  end

  resources :users, only: [:create, :show]

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  # Defines the root path route ("/")
  # root "articles#index"
end
