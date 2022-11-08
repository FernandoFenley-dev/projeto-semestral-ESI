Dado('que estou na página de agendamento de serviço') do
    visit 'agendamentos/new'
  end
  
  Quando('clico em Agendar') do
    click_on 'Agendar'
  end
  
  Então('o Agendamento deve ter sido salvo no banco de dados') do
    agendamento = Agendamento.order("id").last
    expect(agendamento.idServico).to eq('1')
    expect(agendamento.idBarbeiro).to eq('1')

  end
  

  Quando('seleciono o ano {string}') do |string|
    select string, :from => "agendamento[dataAgendamento(1i)]"
  end
