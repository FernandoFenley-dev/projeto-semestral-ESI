Rails.application.routes.draw do
  resources :clientes

  root to:"main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
