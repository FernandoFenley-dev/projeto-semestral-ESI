require 'rails_helper'

RSpec.describe "Usuarios", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/usuarios/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /cadastro" do
    it "creates a new user" do
      post '/cadastro', params: {
        usuario: {
          email: 'osvaldo@gmail.com', 
          password: '123senha', 
          nome: 'Osvaldo', 
          iscliente: false
        }
      }
    
      expect(response).to be_redirect
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

  describe "GET /perfil-image/:id" do
    it "returns http success" do
      @barbeiro = Usuario.create(email: 'osvaldo@gmail.com', password: '123senha', 
      nome: 'Osvaldo', iscliente: false)
      
      post '/login', params: {
    
        email: "osvaldo@gmail.com",
        password: '123senha' 
      }
    
      expect(response).to be_redirect

      get "/perfil-image/01"
      expect(response).to be_redirect

      expect(response).to redirect_to('/perfil/1')
    end
  end

end
