Dado('que estou na página de cadastro de barbeiro') do
    visit 'barbeiros/new'
  end
  
  Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
  end
  
  Quando('clico em Cadastrar') do
    click_on 'Cadastrar'
  end
  
  Então('ele deve ter sido salvo no banco de dados') do
    barbeiro = Barbeiro.order("id").last
    expect(barbeiro.nome).to eq('Guilherme Jimenes')
    expect(barbeiro.email).to eq('guilherme.jimenes@usp.br')
  end
  
  Quando('deixo o campo {string} vazio') do |string|
    fill_in string, :with => ""
  end
  
  Então('deverei ver a mensagem de erro {string}') do |string|
    expect(page).to have_content(string)
  end
  