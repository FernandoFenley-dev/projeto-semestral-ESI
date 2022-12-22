Quando('eu clicar em algum dia do calendário') do
    # Clique randômico em algum dos links de dias do calendário
    @data = Date.today
    @data = @data + rand(1..30).days
    find(:css, '.calendario__dia', :match => :first).click
end

Então('os itens do calendário não devem conter links para os agendamentos') do
    expect(page).to have_no_css('.calendario__contem_agendamento')
end
  
Quando('eu clicar no dia que eu agendei') do
    # Encontra o dia do calendário que contém o agendamento ( dia atual )
    visit '/'
    find(:css, '.calendario__contem_agendamento', :match => :first).click
end

Então('não deverei ver a mensagem {string}') do |string|
    expect(page).to have_no_content(string)
end

Dado('que eu agendei {string} serviços para a data {string} e horários a partir das {string} até as {string}') do |string, string2, string3, string4|
    # Usuário teste
    @usuario = Usuario.create(email: 'emailteste@gmail.com' , password: '123senha', nome: 'Teste', iscliente: true)

    # Barbeiro teste 
    @barbeiro = Usuario.create(email: 'barbeiroteste@gmail.com', password: '123senha', nome: 'Barbeiro', iscliente: false)

    visit 'login'
    fill_in 'email', :with => 'emailteste@gmail.com'
    fill_in 'password', :with => '123senha'
    click_on 'Login'

    expect(page).to have_current_path('/')

    num_agendamentos = string.to_i
    data_agendamento = string2
    inicio_horarios = string3 # Ex: 08:00
    fim_horarios = string4 # Ex: 12:00

    # Cria os agendamentos
    num_agendamentos.times do |i|
        data_hora = data_agendamento + ' ' + inicio_horarios
        data_hora = data_hora.to_datetime + i.hours
        
        Agendamento.create(data_agendamento: data_hora, cliente_id: 1, barbeiro_id: 2)
    end

    @agendamentos = Agendamento.where(data_agendamento: DateTime.new(data_agendamento.to_datetime.year, data_agendamento.to_datetime.month, data_agendamento.to_datetime.day, inicio_horarios.to_datetime.hour, inicio_horarios.to_datetime.min, inicio_horarios.to_datetime.sec)..DateTime.new(data_agendamento.to_datetime.year, data_agendamento.to_datetime.month, data_agendamento.to_datetime.day, fim_horarios.to_datetime.hour, fim_horarios.to_datetime.min, fim_horarios.to_datetime.sec))

    expect(@agendamentos.count).to eq(num_agendamentos)
  end
  
Quando('eu clicar no dia {string}') do |string|
    data = string
    visit '/?data=' + data
    find(:css, "a[href='/?data=#{string}']").click
  end


Então('eu devo ver uma lista de agendamentos da data {string}') do |string|
    @agendamentos = Agendamento.where(data_agendamento: string.to_datetime.beginning_of_day..string.to_datetime.end_of_day)
    visit '/?data=' + string # Visita a página com a data passada por parâmetro

    # Link para os agendamentos
    @agendamentos.each do |agendamento|
        expect(page).to have_css("a[href='/agendamentos/#{agendamento.id}']")
    end
end
  
Então('a lista deve conter {string} agendamentos') do |string|
    expect(page).to have_css('.cartao_agendamento__container', count: string.to_i)
end

Quando('eu visualizar o calendário do mês {string}') do |string|
    data = string + '-25'
    url_visita = '/?data=' + data
    visit url_visita
    
    expect(page).to have_current_path(url_visita)
end
  
Então('os horários dos agendamentos devem ser até as {string} horas') do |string|
    # Verifica no css cartao_agendamento__horario
    @agendamentos.each do |agendamento|
        expect(page).to have_css(".cartao_agendamento__horario", text: agendamento.data_agendamento.strftime("%H:%M"))
    end
  end