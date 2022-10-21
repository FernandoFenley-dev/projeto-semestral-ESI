require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it 'invalido sem nome' do
    cliente = Cliente.new
    cliente.email = "augusto.xavier@usp.br"
    cliente.senha = "senhaforte123"
    expect(cliente).not_to be_valid
  end
  it 'invalido sem email' do
    cliente = Cliente.new
    cliente.nome = "Augusto Xavier"
    cliente.senha = "senhaforte123"
    expect(cliente).not_to be_valid
  end
  it 'invalido com email com formato invalido' do
    cliente = Cliente.new
    cliente.nome = "Augusto Xavier"
    cliente.senha = "senhaforte123"
    cliente.email = "augusto#23@saf!"
    expect(cliente).not_to be_valid
  end
end
