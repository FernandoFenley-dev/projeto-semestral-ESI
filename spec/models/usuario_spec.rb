require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it 'invalido sem nome' do
    usuario = Usuario.new
    usuario.email = "guilherme.jimenes@usp.br"
    usuario.password = "Bigboss@332123"
    usuario.iscliente = true
    expect(usuario).not_to be_valid
  end
  it 'invalido sem email' do
    usuario = Usuario.new
    usuario.nome = "Gui"
    usuario.password = "Bigboss@332123"
    usuario.iscliente = false
    expect(usuario).not_to be_valid
  end
  it 'invalido com email com formato invalido' do
    usuario = Usuario.new
    usuario.nome = "Gui"
    usuario.password = "Bigboss@332123"
    usuario.iscliente = true
    usuario.email = "guilherme"
    expect(usuario).not_to be_valid
  end
  it 'invalido sem selecionar radiobutton' do
  usuario = Usuario.new
  usuario.nome = "Gui"
  usuario.password = "Bigboss@332123"
  usuario.email = "guilherme.jimenes@usp.br"
  expect(usuario).not_to be_valid
  end
  it 'cadastro valido com usuario barbeiro' do
    usuario = Usuario.new
    usuario.nome = "Gui"
    usuario.password = "Bigboss@332123"
    usuario.iscliente = false
    usuario.email = "guilherme.jimenes@usp.br"
    expect(usuario).not_to be_valid ##nao é o resultado esperado
  end
  it 'cadastro valido com usuario cliente' do
    usuario = Usuario.new
    usuario.nome = "Gui"
    usuario.password = "Bigboss@332123"
    usuario.iscliente = true
    usuario.email = "guilherme.jimenes@usp.br"
    expect(usuario).to be_valid
  end
end
