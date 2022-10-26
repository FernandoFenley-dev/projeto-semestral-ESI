Rails.application.routes.draw do
  # ROTAS AUTENTICAÇÃO
  get 'login' => 'sessoes#new'
  post 'login'   => 'sessoes#create'
  delete 'logout'  => 'sessoes#destroy'
  
  # CADASTRO DE USUÁRIOS
  get 'cadastro' => 'usuarios#new'

  # PÁGINA PERFIL
  get 'perfil/:id' => 'usuarios#edit', as: :perfil

  resources :clientes
  resources :agendamentos
  resources :usuarios

  root to:"sessoes#new"
end
