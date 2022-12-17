require 'rails_helper'

RSpec.describe "contatos/new", type: :view do
  before(:each) do
    assign(:contato, Contato.new(
      nome: "Augusto Xavier",
      email: "augusto.xavier@usp.br",
      mensagem: "Gostaria de elogiar o serviço prestado."
    ))
  end

  it "renderiza o form de criar mensagem" do
    render

    assert_select "form[action=?][method=?]", contatos_path, "post" do

      assert_select "input[name=?]", "contato[nome]"

      assert_select "input[name=?]", "contato[email]"

      assert_select "input[name=?]", "contato[mensagem]"
    end
  end
end
