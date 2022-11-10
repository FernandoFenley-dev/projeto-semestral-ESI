require 'rails_helper'

RSpec.describe "Agendamentos", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/agendamentos/new"
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /new" do
    it "agendamento show" do
      @cliente = Usuario.create(email: 'luiz@gmail.com', password: '123senha', 
      nome: 'Luiz', iscliente: true)
      
      @barbeiro = Usuario.create(email: 'osvaldo@gmail.com', password: '123senha', 
      nome: 'Osvaldo', iscliente: false)
      
      @agendamento = Agendamento.create(cliente_id: @cliente.id, barbeiro_id: @barbeiro.id, data_agendamento: DateTime.new(2023,2,2,12,30,0))

      get "/agendamentos/1"
      expect(response).to have_http_status(:success)
    end
  end
end