Dado('que estou na página de agendamento de serviço') do
    visit 'agendamentos/new'
end

Dado('que existe um usuario com id {string} logado') do |string|
  session[:idUsuario] = string
end
Dado('que existe um barbeiro chamado {string} cadastrado') do |string|
  @barbeiro=Usuario.new
  @barbeiro.nome=string
  @barbeiro.email="teste@gmail.com"
  @barbeiro.created_at=Time.now
  @barbeiro.updated_at=Time.now
  @barbeiro.password="123"
  @barbeiro.iscliente=false
  
  if @barbeiro.save
    puts "SUCESSO"
  else
    puts @user.errors.full_messages
  end
end 


  Quando('clico em Agendar') do
    click_on 'Agendar'
  end
  
  Então('o Agendamento deve ter sido salvo no banco de dados') do
    agendamento = Agendamento.last
    puts agendamento
    expect(agendamento.barbeiro_id).to eq(1)
  end
  

  Quando('seleciono o ano {string}') do |string|
    select string, :from => "agendamento[dataAgendamento(1i)]"
  end

  Então('deverei ver o nome de barbeiro {string}') do |string|
    expect(page).to have_content(@barbeiro.nome)
  end
  
  Quando('seleciono o barbeiro {string}') do |string|
    select string, :from => "agendamento_barbeiro_id"
  end