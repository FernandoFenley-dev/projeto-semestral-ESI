Dado('que estou na página de agendamento de serviço') do
    visit 'agendamentos/new'
  end
Dado('que existe um barbeiro cadastrado') do
  @barbeiro=Usuario.new
  @barbeiro.nome="teste"
  @barbeiro.email="teste@gmail.com"
  @barbeiro.created_at=Time.now
  @barbeiro.updated_at=Time.now
  @barbeiro.password="123"
  @barbeiro.iscliente=false
  if @barbeiro.save
    puts "SUCESSO"
  else
    puts "ERROR SALVAR BARBEIRO"
    puts @barbeiro.errors.full_messages
  end

end 
  Quando('clico em Agendar') do
    click_on 'Agendar'
  end
  
  Então('o Agendamento deve ter sido salvo no banco de dados') do
    agendamento = Agendamento.order("id").last
    puts agendamento
    expect(agendamento.idBarbeiro).to eq('1')
  end
  

  Quando('seleciono o ano {string}') do |string|
    select string, :from => "agendamento[dataAgendamento(1i)]"
  end

  Então('deverei ver o nome correspondente ao id {string}') do |string|
    @barbeiro = Usuario.where("id = "+string)
    puts "ccccccccc"
    puts @barbeiro
    expect(page).to have_content(@barbeiro.nome)
  end
  
  Quando('seleciono o barbeiro {string}') do |string|
    @barber = Usuario.order("id").last
    puts "SELECIONO O BARBEIRO"
    puts @barber.nome
    string = @barber.nome
    select string, :from => "agendamento_idBarbeiro"
  end