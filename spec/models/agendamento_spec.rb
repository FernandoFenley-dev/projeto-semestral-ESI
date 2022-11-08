require 'rails_helper'

RSpec.describe Agendamento, type: :model do

  #before(:all) do
    
  #end

  it 'invalido sem nome do Cliente' do
    agendamento = Agendamento.new
    agendamento.cliente_id = nil
    agendamento.barbeiro_id   = 1
    agendamento.nomeServico   = 'Cabelo'
    agendamento.dataAgendamento  = DateTime.now
    expect(agendamento).not_to be_valid
  end
  it 'invalido sem nome do barbeiro' do
    agendamento = Agendamento.new
    agendamento.cliente_id = 2
    agendamento.barbeiro_id   = nil
    agendamento.dataAgendamento  = DateTime.now
    agendamento.nomeServico   = 'Cabelo'
    expect(agendamento).not_to be_valid
  end
  it 'invalido sem nome do serviço' do
    agendamento = Agendamento.new
    agendamento.cliente_id = 2
    agendamento.barbeiro_id   = 1
    agendamento.dataAgendamento  = DateTime.now
    agendamento.nomeServico   = nil
    expect(agendamento).not_to be_valid
  end
  it 'exemplo válido' do
    # default call to factory
    usuarioBarbeiro = create(:usuario, nome: "Jonas", email: "jonas@gmail.com", iscliente: true)
    #user1 attributes will be username: Joe, email: joe@gmail.com, #password: blah# override default arguments
    usuarioCliente = create(:usuario, nome: "Barbara", email: "barbara@gmail.com", iscliente: true)
    #user2 attributes will be username: Bob, email: bob@gmail.com, #password: blah

    agendamento = Agendamento.new
    agendamento.cliente_id = usuarioCliente.id
    agendamento.nomeServico   = 'Cabelo'
    agendamento.barbeiro_id   = usuarioBarbeiro.id
    agendamento.dataAgendamento  = DateTime.now.next_month(1).to_time
    expect(agendamento).to be_valid
  end
end
