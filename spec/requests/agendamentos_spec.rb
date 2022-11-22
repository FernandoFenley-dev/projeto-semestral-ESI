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
    describe "Destroy agendamento" do
    it "agendamento destroy" do
      @cliente = Usuario.create(email: 'augusto@gmail.com', password: '123456789',
      nome: 'Augusto', iscliente: true)

      @barbeiro = Usuario.create(email: 'clovis@gmail.com', password: '987654321',
      nome: 'Clovis', iscliente: false)

      @agendamento = Agendamento.create(cliente_id: @cliente.id, barbeiro_id: @barbeiro.id, data_agendamento: DateTime.new(2023,2,2,12,30,0))

      delete '/agendamentos-barbeiro/1/', :params => { :id =>  @agendamento.id }
      expect { get "/agendamentos/1" }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end