Rails.application.routes.draw do
  # ROTAS AUTENTICAÇÃO
  get 'login' => 'sessoes#new'
  post 'login'   => 'sessoes#create'
  delete 'logout'  => 'sessoes#destroy'

  resources :clientes
  resources :agendamentos
  resources :usuarios

  root to:"sessoes#new"
end
