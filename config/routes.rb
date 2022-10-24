Rails.application.routes.draw do
  resources :clientes
  resources :agendamentos

  root to:"main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
