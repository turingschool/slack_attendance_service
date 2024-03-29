Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do 
    namespace :v0 do 
      resources :attendance, only: :index
      resources :channel_members, only: :index
    end 
    namespace :v1 do 
      resources :attendance, only: :index
    end 
  end 
end
