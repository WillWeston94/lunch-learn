Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      get 'learning_resources', to: 'learning_resources#show'
      post 'users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      get 'favorites', to: 'favorites#index'
      post 'favorites', to: 'favorites#create'
      delete 'favorites', to: 'favorites#destroy'
    end
  end
end
