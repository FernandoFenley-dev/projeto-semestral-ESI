require 'rails_helper'
require 'spec_helper'

RSpec.describe Usuario, type: :model do
  it 'invalido sem email' do
    usuario = Usuario.new
    usuario.password = "123123"
    expect(usuario).not_to be_valid
  end
  it 'invalido com email com formato invalido' do
    usuario = Usuario.new
    usuario.password= "123123" 
    usuario.email = "a,@gmail.com"    
    expect(usuario).not_to be_valid
  end
  it 'invalido sem senha' do
    usuario = Usuario.new
    usuario.email = "emailteste@gmail.com"
    expect(usuario).not_to be_valid
  end
  it 'novo deve ser validado se é cliente' do
    usuario = Usuario.new
    expect(usuario.should_validate_iscliente?).to be_truthy
  end
end
