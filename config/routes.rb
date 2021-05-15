Rails.application.routes.draw do

  get "index", to: "static#index"
  resources :addresses
  resources :concerts
  resources :venues
  resources :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
