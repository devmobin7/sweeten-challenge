Rails.application.routes.draw do
  resources :renovation_projects, only: [:index, :new, :create, :show]
  resources :general_contractors, only: [:index, :new, :create, :show]
  resources :contracts, only: [:create, :update]

  root 'home#index'
end
