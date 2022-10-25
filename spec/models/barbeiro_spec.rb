require 'rails_helper'

RSpec.describe Barbeiro, type: :model do
  it 'invalido sem nome' do
    barbeiro = Barbeiro.new
    barbeiro.email = "guilherme.jimenes@usp.br"
    barbeiro.senha = "@Senha123"
    expect(barbeiro).not_to be_valid
  end
  it 'invalido sem email' do
    barbeiro = Barbeiro.new
    barbeiro.nome = "Guilherme J"
    barbeiro.senha = "@Senha123"
    expect(barbeiro).not_to be_valid
  end
  it 'invalido com email com formato invalido' do
    barbeiro = Barbeiro.new
    barbeiro.nome = "Guilherme J"
    barbeiro.senha = "@Senha123"
    barbeiro.email = "guilhermao.com"
    expect(barbeiro).not_to be_valid
  end
end
