Dado('que estou na página de agendamento de serviço') do
    visit 'agendamentos/new'
  end
  
  Quando('clico em Agendar') do
    click_on 'Agendar'
  end
  
  Então('o Agendamento deve ter sido salvo no banco de dados') do
    agendamento = Agendamento.order("id").last
    expect(agendamento.nomeServico).to eq('corte')
    expect(agendamento.nomeBarbeiro).to eq('jalmir')

  end
  

  Quando('seleciono o ano {string}') do |string|
    select string, :from => "agendamento[dataAgendada(1i)]"
  end