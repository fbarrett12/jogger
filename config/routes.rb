Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  
  get 'about', to: 'pages#about', as: 'about'
  post 'posts/:id/destroy', to: 'posts#destroy', as: "destroy_post"

  resources :users
  
  get "welcome", to: "home#index", as: "welcome"
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "explore", to: "explore#index", as: "explore"
  delete "sessions", to: "sessions#destroy", as: "logout"
  
  resources :posts do
    resources :comments
  end

end
