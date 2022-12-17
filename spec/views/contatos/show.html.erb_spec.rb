require 'rails_helper'

RSpec.describe "contatos/show", type: :view do
  before(:each) do
    assign(:contato, Contato.create!(
      nome: "Augusto Xavier",
      email: "augusto.xavier@usp.br",
      mensagem: "Gostaria de elogiar o serviço prestado."
    ))
  end

  it "renderiza o contato específico" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Mensagem/)
  end
end
