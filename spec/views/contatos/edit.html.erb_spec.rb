require 'rails_helper'

RSpec.describe "contatos/edit", type: :view do
  let(:contato) {
    Contato.create!(
      nome: "Augusto Xavier",
      email: "augusto.xavier@usp.br",
      mensagem: "Gostaria de elogiar o serviço prestado."
    )
  }

  before(:each) do
    assign(:contato, contato)
  end

  it "renderiza o formulário de edição" do
    render

    assert_select "form[action=?][method=?]", contato_path(contato), "post" do

      assert_select "input[name=?]", "contato[nome]"

      assert_select "input[name=?]", "contato[email]"

      assert_select "input[name=?]", "contato[mensagem]"
    end
  end
end
