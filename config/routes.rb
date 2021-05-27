Rails.application.routes.draw do

  get "index", to: "static#index"
  

  resources :venues, only: [:show] do
    resources :concerts
  end

  resources :artists, only: [:show] do
    resources :concerts
  end

  resources :artists, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :venues, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
