Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  
  get 'about', to: 'pages#about', as: 'about'
  post 'posts/:id/destroy', to: 'posts#destroy', as: "destroy_post"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  
  resources :posts do
    resources :comments
  end

end
