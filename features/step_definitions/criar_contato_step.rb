Dado('que estou na página de criar contato') do
    visit 'contatos/new'
end

Dado('que estou na página de contatos realizados') do
    visit 'contatos'
end

Dado('que estou logado como cliente') do
    visit 'login'
    fill_in "email", :with => "emailteste@gmail.com"
    fill_in "password", :with => "123senha@gmail.com"
    click_on 'Login'
end

Quando('clico em {string}') do |string|
  click_on string
end

Dado('que realizei contato anteriormente') do
    visit 'contatos/new'
    fill_in "Nome", :with => "Augusto Xavier"
    fill_in "Email", :with => "augusto.xavier@usp.br"
    fill_in "Mensagem", :with => "Gostaria de elogiar o barbeiro Clovis"
    click_on 'Enviar mensagem'
end

Então('a mensagem deve ter sido salva no banco de dados') do
  contato = Contato.order("id").last
  expect(contato.nome).to eq('Augusto Xavier')
  expect(contato.email).to eq('augusto.xavier@usp.br')
  expect(contato.mensagem).to eq('Gostaria de elogiar o barbeiro Clovis')
end

Então('deverei ver a informação {string}') do |string|
  expect(page).to have_content(string)
end
