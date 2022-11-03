Rails.application.routes.draw do
  # ROTAS AUTENTICAÇÃO
  get 'login' => 'sessoes#new'
  post 'login'   => 'sessoes#create'
  delete 'logout'  => 'sessoes#destroy'
  
  # CADASTRO DE USUÁRIOS
  get 'cadastro' => 'usuarios#new'

  # PÁGINA PERFIL
  get 'perfil/:id' => 'usuarios#edit', as: :perfil

  get 'agendamentos/:nomeBarbeiro/', to: 'agendamentos#barbeador'

  # AGENDAMENTOS DE UM BARBEADOR
  resources :agendamentos
  resources :clientes
  resources :usuarios

  root to:"sessoes#new"
end
