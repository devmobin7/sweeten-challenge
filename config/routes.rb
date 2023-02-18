Rails.application.routes.draw do
  resources :general_contractors, only: [:index, :new, :create, :show]
end
