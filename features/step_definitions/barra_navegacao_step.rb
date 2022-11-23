Dado('que estou registrado no sistema como barbeiro') do
  @usuario = Usuario.create(email: 'emailteste1@gmail.com', password: '123senha', 
    nome: 'Barbeiro teste', iscliente: false)
  expect(@usuario).to be_valid
end

Dado('que eu estou logado no sistema como barbeiro') do
  visit 'login'
  fill_in 'email', :with => 'emailteste1@gmail.com'
  fill_in 'password', :with => '123senha'
  click_on 'Login'
end

Quando('eu for redirecionado para a página de dashboard') do
  expect(page).to have_current_path('/')
end

Então('deverei visualizar a barra de navegação superior') do
  expect(page).to have_css('header')
end

Então('a barra de navegação deve conter links para as páginas {string} e {string}') do |string0, string1|
  expect(page).to have_link(string0)
  expect(page).to have_link(string1)
end

Quando('eu clicar no link {string}') do |string|
  click_on string
end

Então('deverei ser redirecionado para a página "Agendar serviço"') do
  expect(page).to have_current_path('/agendamentos/new')
end

Então('deverei ser redirecionado para a página "Minha agenda"') do
  expect(page).to have_current_path(/\/agendamentos-barbeiro\//)
end

Então('a barra de navegação deve conter um botão para sair do sistema') do
  # Classe do botão de logout: header__logout_icon
  expect(page).to have_css('.header__logout_icon')
end

Quando('eu clicar no botão de logout') do
  # Classe do botão de logout: header__logout_icon
  find('button.header__logout_icon').click
end

Então('deverei ser deslogado do sistema') do
  # A sessão do usuário é destruída ao clicar no botão de logout
  expect(Current.usuario).to be_nil
  expect(page).to have_current_path('/login')
end