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
end
