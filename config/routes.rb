Rails.application.routes.draw do
  # ROTAS AUTENTICAÇÃO
  get 'login' => 'sessoes#new'
  post 'login'   => 'sessoes#create'
  delete 'logout'  => 'sessoes#destroy'
  
  # CADASTRO DE USUÁRIOS
  get 'cadastro' => 'usuarios#new'

  # PÁGINA PERFIL
  get 'perfil/:id' => 'usuarios#edit', as: :perfil
  get 'agendamentos/new' => 'agendamentos#new', as: :agendamentos_new


  resources :agendamentos
  resources :clientes
  resources :usuarios

  # AGENDAMENTOS DE UM BARBEADOR
  get 'agendamentos-barbeiro/:nomeBarbeiro/', to: 'agendamentos#barbeador'

  root to:"sessoes#new"
end
