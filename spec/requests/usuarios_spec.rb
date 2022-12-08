require 'rails_helper'

RSpec.describe "Usuarios", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/usuarios/new"
      expect(response).to have_http_status(:success)
    end
  end

  context "with valid attributes" do
    it "creates a new contact" do
      usuarioBarbeiro = create(:usuario).should be_valid
    end
  end
  context "with invalid attributes" do
    it "creates a new contact" do
      usuarioBarbeiro = create(:invalido_usuario)
      usuarioBarbeiro.nome=nil
      usuarioBarbeiro.should_not be_valid
    end
  end
end
