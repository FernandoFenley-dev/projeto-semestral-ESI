Dado('que estou na página inicial') do
  visit 'login'
end

Quando('preencho o campo de login {string} com {string}') do |string1, string2|
  fill_in string1, :with => string2
end

Quando('clico em Login') do
  click_on 'Login'
end

Então('devo ser redirecionado para a tela de perfil') do
  expect(page.status_code).to eq(200)
end
