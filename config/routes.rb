Rails.application.routes.draw do

  get "/", to: "static#index"

  get "/sign-up", to: "artists#new"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  get '/auth/github/callback' => 'sessions#create' 

  get '/auth/facebook/callback' => 'sessions#create' 

  resources :concerts

  resources :artists, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :venues, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  resources :venues, only: [:show] do
    resources :concerts, only: [:show, :index, :new, :edit]
  end

  resources :artists, only: [:show] do
    resources :concerts,  only: [:show, :index, :new, :edit]
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
