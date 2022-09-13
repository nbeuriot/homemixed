Rails.application.routes.draw do
  devise_for :users
  root to: "ingredients#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/home', to: 'pages#home'
  get "/cocktails/tips", to: "cocktails#tips"
  resources :pages, only: [:index, :home]
  resources :ingredients, only: [:index]
  resources :favorites, only: [:index, :create, :new, :destroy]

  resources :cocktails, only: [:index, :show]
  resources :user_ingredients, only: [:index, :destroy] do
    resources :ingredients, only: [:create, :new,]
  end
  # custom routes
  get "/ready_to_make", to: "cocktails#ready_to_make", as: :ready_to_make
  post "/add_ingredient/:id", to: "user_ingredients#create", as: :add_ingredients
  get "/non_spirits", to: "ingredients#non_spirits", as: :non_spirits

end
