Dado('que estou na página de cadastro de cliente') do
  visit 'clientes/new'
end

Quando('preencho o campo {string} com {string}') do |string, string2|
  fill_in string, :with => string2
end

Quando('clico em Cadastrar') do
  click_on 'Cadastrar'
end

Então('ele deve ter sido salvo no banco de dados') do
  cliente = Cliente.order("id").last
  expect(cliente.nome).to eq('Augusto Xavier')
  expect(cliente.email).to eq('augusto.xavier@usp.br')
end

Quando('deixo o campo {string} vazio') do |string|
  fill_in string, :with => ""
end

Então('deverei ver a mensagem de erro {string}') do |string|
  expect(page).to have_content(string)
end
