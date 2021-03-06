require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "exports#index"
  resources :exports, only: [:index] do
    collection do
      get :export_xls
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
