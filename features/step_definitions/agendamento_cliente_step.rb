require 'cucumber/rspec/doubles'

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

Dado('que estou na página de agendamento de serviço') do
    visit 'agendamentos/new'
end

Quando('seleciono o barbeiro {string}') do |string|
  select string, :from => "agendamento_barbeiro_id"
end

Quando('seleciono o ano {string}') do |string|
  select string, :from => "agendamento[dataAgendamento(1i)]"
end

Quando('clico em Agendar') do
  click_on 'Agendar'
end

Então('o Agendamento deve ter sido salvo no banco de dados') do
  @usuario = Usuario.create(email: 'luiz@gmail.com', password: '123senha', 
  nome: 'Luiz', iscliente: true)

  @usuario = Usuario.create(email: 'osvaldo@gmail.com', password: '123senha', 
  nome: 'Osvaldo', iscliente: false)

  @agendamento = Agendamento.create(cliente_id: 2, barbeiro_id: 1, dataAgendamento: DateTime.new(2023,2,2,12,30,0))

  expect(@agendamento.barbeiro_id).to eq(1)
 end

Então('deverei ver o nome de barbeiro {string}') do |string|
  expect(page).to have_content(@barbeiro.nome)
end
