Então('que eu agendei {string} serviços para o dia') do |string|
    # OBS: dependendo da hora que este teste rodar, pode ser que o agendamento não seja mais exibido na página inicial, pois o agendamento é feito para o dia seguinte.

    @data_atual = Time.now

    # Usuário teste
    @usuario = Usuario.create(email: 'emailteste@gmail.com' , password: '123senha', nome: 'Teste', iscliente: true)

    # Barbeiro teste 
    @barbeiro = Usuario.create(email: 'barbeiroteste@gmail.com', password: '123senha', nome: 'Barbeiro', iscliente: false)

    visit 'login'
    fill_in 'email', :with => 'emailteste@gmail.com'
    fill_in 'password', :with => '123senha'
    click_on 'Login'

    expect(page).to have_current_path('/')

    # adiciona 10 minutos ao dia atual
    num_agendamentos = string.to_i
    mins = 0

    for a in 1..2 do
        mins = mins + 10
        @data_atual=@data_atual+mins.minutes
        criarAgendamento(@data_atual )
    end
    
    @agendamentos = Agendamento.where(cliente_id: 1, barbeiro_id: 2)
    expect(@agendamentos.count).to eq(num_agendamentos)
end
def criarAgendamento(data_atual)
    @agendamento = Agendamento.create(cliente_id: 1, barbeiro_id: 2, data_agendamento: data_atual )
end

Então('eu devo ver uma lista de agendamentos do dia') do
    @agendamentos = Agendamento.where(cliente_id: 1, barbeiro_id: 2)

    visit '/'

    # Link para os agendamentos
    @agendamentos.each do |agendamento|
        expect(page).to have_css("a[href='/agendamentos/#{agendamento.id}']")
    end
end


Então('cada agendamento deve conter o nome do barbeiro e o horário do agendamento') do 
    @agendamentos.each do |agendamento|
        expect(page).to have_content(agendamento.barbeiro.nome)
        expect(page).to have_content(agendamento.data_agendamento.strftime("%H:%M"))
    end
end

Então('eu devo somente ver o agendamento mais próximo do dia-hora atual') do
    @proximo_agendamento = @agendamentos.order(:data_agendamento).first

    puts @proximo_agendamento.data_agendamento
    barbeiro = Usuario.find(@proximo_agendamento.barbeiro_id)

    expect(page).to have_content(barbeiro.nome)
    expect(page).to have_content(@proximo_agendamento.data_agendamento.strftime("%H:%M"))

    expect(page).to have_css('.cartao_agendamento__container', count: 1)
end

Então('não devo ver agendamentos anteriores ao dia-hora atual') do
    data_hora_atual = DateTime.now

    @agendamentos.each do |agendamento|
        expect(agendamento.data_agendamento).to be >= data_hora_atual
    end
end

Então('eu clicar em um agendamento') do
    visit '/'
    @proximo_agendamento = @agendamentos.first
    find(:css, '#primeiro', :match => :first).click

    # expect(page).to have_current_path("/agendamentos/#{@proximo_agendamento.id}")
end

Então('eu devo ser redirecionado para a página de detalhes do agendamento') do
    expect(page).to have_current_path('/agendamentos/' + @proximo_agendamento.id.to_s)
end

Então('eu devo ver o  meu nome, o nome do barbeiro e a data-hora do agendamento') do
    expect(page).to have_content(@agendamento.cliente.nome)
    expect(page).to have_content(@agendamento.barbeiro.nome)
    expect(page).to have_content(@agendamento.data_agendamento.strftime("%H:%M"))
end
