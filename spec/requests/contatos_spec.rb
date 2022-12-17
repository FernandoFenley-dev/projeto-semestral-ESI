require 'rails_helper'

RSpec.describe "/contatos", type: :request do

  let(:atributos_validos) {
    {nome: 'Augusto Xavier', email: 'augusto.xavier@usp.br', mensagem: 'Gostaria de elogiar o serviço prestado'}
  }

  let(:atributos_invalidos) {
    {nome: 'Augusto Xavier', email: 'augustoemailinvalido', mensagem: 'Gostaria de elogiar o serviço prestado'}
  }

  describe "GET /index" do
    it "retorna sucesso" do
      Contato.create! atributos_validos
      get contatos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "retorna sucesso" do
      contato = Contato.create! atributos_validos
      get contato_url(contato)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "retorna sucesso" do
      get new_contato_url
      expect(response).to be_successful
    end
  end

  describe "retorna sucesso" do
    it "renders a successful response" do
      contato = Contato.create! atributos_validos
      get edit_contato_url(contato)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "com parametros validos" do
      it "cria um novo Contato" do
        expect {
          post contatos_url, params: { contato: atributos_validos }
        }.to change(Contato, :count).by(1)
      end

      it "redireciona para o contato criado" do
        post contatos_url, params: { contato: atributos_validos }
        expect(response).to redirect_to(contato_url(Contato.last))
      end
    end

    context "com parametros invalidos" do
      it "não cria um novo Contato" do
        expect {
          post contatos_url, params: { contato: atributos_invalidos }
        }.to change(Contato, :count).by(0)
      end

    
      it "retorna 422" do
        post contatos_url, params: { contato: atributos_invalidos }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "com parametros validos" do
      let(:atributos_atualizados) {
        {nome: 'Augusto Xavier', email: 'augusto.xavier@hotmail.com', mensagem: 'Gostaria de elogiar o serviço prestado'}
      }

      it "atualiza a mensagem" do
        contato = Contato.create! atributos_validos
        patch contato_url(contato), params: { contato: atributos_atualizados }
        contato.reload
        expect(contato.email).to eq('augusto.xavier@hotmail.com')
      end

      it "abre a mensagem atualizada" do
        contato = Contato.create! atributos_validos
        patch contato_url(contato), params: { contato: atributos_atualizados }
        contato.reload
        expect(response).to redirect_to(contato_url(contato))
      end
    end

    context "com parametros invalidos" do
    
      it "retorna 422" do
        contato = Contato.create! atributos_validos
        patch contato_url(contato), params: { contato: atributos_invalidos }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "apaga a mensagem" do
      contato = Contato.create! atributos_validos
      expect {
        delete contato_url(contato)
      }.to change(Contato, :count).by(-1)
    end

    it "redireciona aos contatos realizados" do
      contato = Contato.create! atributos_validos
      delete contato_url(contato)
      expect(response).to redirect_to(contatos_url)
    end
  end
end
