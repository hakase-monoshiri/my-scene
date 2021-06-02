Rails.application.routes.draw do

  get "index", to: "static#index"
  
  get "sign-up", to: "static#sign_up"

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
