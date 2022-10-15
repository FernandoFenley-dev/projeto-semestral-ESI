require 'rails_helper'

RSpec.describe "Clientes", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/clientes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/clientes/create"
      expect(response).to have_http_status(:success)
    end
  end

end
