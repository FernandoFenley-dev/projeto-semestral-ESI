require 'rails_helper'

RSpec.describe Agendamento, type: :model do
  it 'invalido sem nome do barbeiro' do
    agendamento = Agendamento.new
    agendamento.nomeServico = "barba"
    agendamento.dataAgendada  = Time.now
    expect(agendamento).not_to be_valid
  end
end
