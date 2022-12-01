Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  origins '*'
  resource '*', headers: :any, methods: [:get]

  namespace :api do 
    namespace :v0 do 
      resources :attendance, only: :index
    end 
  end 
end
