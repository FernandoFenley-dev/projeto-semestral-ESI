require 'rails_helper'

RSpec.describe "/", type: :request do
    # APENAS TESTES NÃO LOGADOS, JÁ QUE COM RSPEC NÃO É POSSÍVEL FAZER LOGIN
    describe "GET /" do
        it "retorna redirecionamento para login" do
            get root_url
            expect(response).to have_http_status(302)
        end
    end 

    # Teste tentando acessar a página de agendamentos
    describe "GET /?data=2022-12-18" do
        it "retorna redirecionamento para login" do
            get root_url
            expect(response).to redirect_to('/login')
        end
    end

end