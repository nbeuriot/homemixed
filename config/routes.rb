Rails.application.routes.draw do
  devise_for :users
  root to: "ingredients#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/home', to: 'pages#home'
  resources :pages, only: [:index, :home]
  resources :ingredients, only: [:index]

  resources :cocktails, only: [:index, :show]
  resources :user_ingredients, only: [:index] do
    resources :ingredients, only: [:create, :new, :destroy]
  end
  # custom routes
  get "/non_spirits", to: "ingredients#non_spirits", as: :non_spirits
end
