Dado('que estou na página de recuperação de senha') do
    visit 'recuperar-senha'
end

Quando('clico no botão Enviar email') do
    click_on 'Enviar email'
end
Então('o email deverá ter sido enviado') do
    expect(Delayed::Job.count).to eq(1)
end
