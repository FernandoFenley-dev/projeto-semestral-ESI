Dado('que estou na página de cadastro de usuario') do
    visit 'usuarios/new'
  end
  
  Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
  end
  
  Quando('clico em Cadastrar') do
    click_on 'Cadastrar'
  end
  
  Quando('seleciono Sou cliente') do
    choose('is_Cliente')
  end
  
  Então('ele deve ter sido salvo no banco de dados') do
    usuario = Usuario.order("id").last
    expect(usuario.nome).to eq('Guilherme Jimenes')
    expect(usuario.email).to eq('guilherme.jimenes@usp.br')
    expect(usuario.isCliente).to eq(true)
  end
  
  Quando('deixo o campo {string} vazio') do |string|
    fill_in string, :with => ""
  end
  
  Então('deverei ver a mensagem de erro {string}') do |string|
    expect(page).to have_content(string)
  end
  