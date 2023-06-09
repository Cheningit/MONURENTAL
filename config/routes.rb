Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  get "download/:id", to: 'bookings#download', as: 'download'
  # get "/buildings", to: "pages#buildings"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/uikit", to: "pages#uikit"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :buildings, only: [:index, :show] do
    resources :reviews, only: :create
    resources :bookings, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]

  resources :users, only: [:profile, :edit, :update] do
    collection do
      get :profile
    end
  end
  resources :bookings, only: [:index, :show, :edit, :destroy]

  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
