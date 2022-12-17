require 'rails_helper'

RSpec.describe Contato, type: :model do
  it 'invalido sem nome' do
    contato = Contato.new
    contato.email = "augusto.xavier@usp.br"
    contato.mensagem = "Gostaria de elogiar o serviço"
    expect(contato).not_to be_valid
  end
  it 'invalido sem email' do
    contato = Contato.new
    contato.nome = "Augusto Xavier"
    contato.mensagem = "Gostaria de elogiar o serviço"
    expect(contato).not_to be_valid
  end
  it 'invalido com email com formato invalido' do
    contato = Contato.new
    contato.nome = "Augusto Xavier"
    contato.mensagem = "Gostaria de elogiar o serviço"
    contato.email = "augusto#23@saf!"
    expect(contato).not_to be_valid
  end
end