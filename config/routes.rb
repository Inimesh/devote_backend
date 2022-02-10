Rails.application.routes.draw do
  resources :receiver_accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    # TODO Resource routes go in here
    resources :configs
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
