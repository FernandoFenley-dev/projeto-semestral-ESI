Dado('que estou na página inicial para barbeiros') do
    @usuario = Usuario.create(email: 'luiz@gmail.com', password: '123senha', 
    nome: 'Luiz', iscliente: true)

    @usuario = Usuario.create(email: 'osvaldo@gmail.com', password: '123senha', 
    nome: 'Osvaldo', iscliente: false)

    Agendamento.create(nomeServico: "Cabelo", cliente_id: 2, 
    barbeiro_id: 1, dataAgendamento: DateTime.new(2023,2,2,12,30,0))
    
    visit 'login'

    fill_in 'email', :with => 'luiz@gmail.com'
    fill_in 'password', :with => '123senha'

    click_on 'Login'
    visit 'usuarios/1'
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
      AND date(dataAgendamento) in (:data)",
      barbeiro_id: 1,
      data: DateTime.new(2023,2,23))

      expect(@agendamentos.length()).to eql(0)
end

Então('deverei ver a mensagem de aviso') do
    expect(page).to have_content('Não há agendamentos neste dia.')
end

