require 'rails_helper'

RSpec.describe "contatos/index", type: :view do
  before(:each) do
    assign(:contatos, [
      Contato.create!(
        nome: "Augusto Xavier",
        email: "augusto.xavier@usp.br",
        mensagem: "Gostaria de elogiar o serviço prestado."
      ),
      Contato.create!(
        nome: "Augusto Xavier",
        email: "augusto.xavier@usp.br",
        mensagem: "Gostaria de elogiar o barbeiro Clovis."
      )
    ])
  end

  it "renderiza a lista de contatos realizados" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mensagem".to_s), count: 2
  end
end
