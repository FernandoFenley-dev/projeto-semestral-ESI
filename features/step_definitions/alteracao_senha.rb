Dado('que estou registrado no sistema') do
  @usuario = Usuario.create(email: 'emailteste@gmail.com', password: '123senha', 
    nome: 'Teste', iscliente: true)
  expect(@usuario).to be_valid
end

Dado('que eu estou logado no sistema') do
  visit 'login'
  fill_in 'email', :with => 'emailteste@gmail.com'
  fill_in 'password', :with => '123senha'
  click_on 'Login'
end

Dado('que estou na página de edição de usuário') do
  visit 'perfil/1'
end

Quando('clico em Confirmar') do
  click_on 'Confirmar'
end

Então('o Usuario deve ter sido salvo no banco de dados') do
  usuario = Usuario.order("id").last
  expect(usuario.nome).to eq('Teste')
  expect(page).to have_current_path('/usuarios/1')
end

Então('deverei ser redirecionado para a página de usuário') do
  expect(page.status_code).to eq(200)
  expect(page).to have_current_path('/usuarios/1')
end
