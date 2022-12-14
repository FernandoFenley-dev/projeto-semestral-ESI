Dado('que estou na página inicial para barbeiros') do
    @usuario = Usuario.create(email: 'luiz@gmail.com', password: '123senha', 
    nome: 'Luiz', iscliente: true)

    @usuario = Usuario.create(email: 'osvaldo@gmail.com', password: '123senha', 
    nome: 'Osvaldo', iscliente: false)

    Agendamento.create(cliente_id: 2, barbeiro_id: 1, data_agendamento: DateTime.new(2023,02,02,12,30,0))
    
    visit 'login'

    fill_in 'email', :with => 'luiz@gmail.com'
    fill_in 'password', :with => '123senha'

    click_on 'Login'
    visit root_path
end

Quando('clicar no botão Minha Agenda') do
    visit '/agendamentos-barbeiro/1?data=2023/02/02'
end

Então('deverei ser redirecionado para a página de Serviços Agendados para o dia atual') do
    expect(page.status_code).to eq(200)
    expect(page).to have_current_path('/agendamentos-barbeiro/1?data=2023/02/02')
end

Dado('que estou na página de Serviços Agendados') do
    visit '/agendamentos-barbeiro/1?data=2023/02/23'
end

Quando('que não há agendamentos para este dia') do
    @agendamentos = Agendamento.where("barbeiro_id = :barbeiro_id 
      AND date(data_agendamento) in (:data)",
      barbeiro_id: 1,
      data: DateTime.new(2023,2,23))

      expect(@agendamentos.length()).to eql(0)
end

Então('deverei ver a mensagem de aviso') do
    expect(page).to have_content('Não há agendamentos neste dia.')
end

Quando('seleciono o ano do agendamento {string}') do |string|
    select string, :from => "data_alterar_date_1i"
end
Quando('seleciono o mes do agendamento {string}') do |string|
    select string, :from => "data_alterar_date_2i"
end

Quando('seleciono o dia do agendamento {string}') do |string|
    select string, :from => "data_alterar_date_3i"
end
Quando('clico em Alterar Data') do
    click_on 'Alterar Data'
  end

Então('deverei ver a mensagem {string}') do |string|
    expect(page).to have_content(string)
end
