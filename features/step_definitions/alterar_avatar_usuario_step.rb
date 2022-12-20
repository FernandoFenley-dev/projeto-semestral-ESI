require 'cucumber/rspec/doubles'

Dado('que estou registrado no sistema como um usuário barbeiro') do
  @usuario = Usuario.create(email: 'barber@gmail.com', password: '123456', 
  nome: 'Barber', iscliente: false)
  expect(@usuario).to be_valid
end

Dado('que eu fiz login no sistema') do
  visit 'login'
  fill_in 'email', :with => 'barber@gmail.com'
  fill_in 'password', :with => '123456'
  click_on 'Login'
end

Dado('que acessei a página de edição de usuário') do
  visit 'perfil/1'
end

Quando('clico em Avatar 02') do
  click_link('avatar_02')
end

Então('a imagem do avatar do barbeiro será alterada') do
  expect(page).to have_xpath("//img[@alt=\"avatar_02\"]")
end