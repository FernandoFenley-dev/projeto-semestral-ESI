Rails.application.routes.draw do
  # ROTA ROOT 
  root 'dashboard#index'

  # ROTAS AUTENTICAÇÃO
  get 'login' => 'sessoes#new'
  post 'login'   => 'sessoes#create'
  delete 'logout'  => 'sessoes#destroy'
  
  # CADASTRO DE USUÁRIOS
  get 'cadastro' => 'usuarios#new'
  post 'cadastro' => 'usuarios#create'

  # PÁGINA PERFIL
  get 'perfil/:id' => 'usuarios#edit', as: :perfil


  get 'agendamentos/new' => 'agendamentos#new', as: :agendamentos_new

  resources :agendamentos
  resources :usuarios

  # AGENDAMENTOS DE UM BARBEADOR
  get 'agendamentos-barbeiro/:barbeiro_id/', to: 'agendamentos#barbeador'
end
