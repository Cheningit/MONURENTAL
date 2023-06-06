Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/buildings", to: "pages#buildings"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/uikit", to: "pages#uikit"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :buildings, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :destroy]
end
