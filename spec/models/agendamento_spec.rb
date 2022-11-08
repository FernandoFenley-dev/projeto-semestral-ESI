require 'rails_helper'

RSpec.describe Agendamento, type: :model do
  it 'invalido sem nome do Cliente' do
    agendamento = Agendamento.new
    agendamento.idBarbeiro   = 1
    agendamento.dataAgendamento  = Time.now
    expect(agendamento).not_to be_valid
  end
  it 'invalido sem nome do barbeiro' do
    agendamento = Agendamento.new
    agendamento.idCliente = 1
    agendamento.dataAgendamento  = Time.now
    expect(agendamento).not_to be_valid
  end
  it 'invalido sem nome do serviço' do
    agendamento = Agendamento.new
    agendamento.idCliente = 1
    agendamento.idBarbeiro   = 1
    agendamento.dataAgendamento  = Time.now
    expect(agendamento).not_to be_valid
  end
  it 'exemplo válido' do
    agendamento = Agendamento.new
    agendamento.idCliente = 1
    agendamento.idBarbeiro   = 1
    agendamento.dataAgendamento  = DateTime.now.next_month(1).to_time
    expect(agendamento).to be_valid
  end
end
