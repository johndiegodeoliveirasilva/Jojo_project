require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "exports#index"
  resources :exports, only: [:index]
  mount Sidekiq::Web => '/sidekiq'
end
