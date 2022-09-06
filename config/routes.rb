Rails.application.routes.draw do
  devise_for :users
  root to: "ingredients#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pages, only: [:index]
  resources :ingredients, only: [:index]
  resources :cocktails, only: [:index, :show]
  resources :user_ingredients, only: [:index] do
    resources :ingredients, only: [:create, :new, :destroy]
  end
end
