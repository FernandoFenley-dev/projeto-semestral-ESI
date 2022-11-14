Dado('que existe um cliente chamado {string} cadastrado') do |string|
  @cliente=Usuario.new
  @cliente.nome=string
  @cliente.email="cliente@teste.com"
  @cliente.created_at=Time.now
  @cliente.updated_at=Time.now
  @cliente.password="123456789"
  @cliente.iscliente=true

  if @cliente.save
    puts "SUCESSO"
  else
    puts @usuario.errors.full_messages
  end
end

Quando('clico em Cancelar agendamento') do
  delete '/agendamentos-barbeiro/1/', :params => { :id =>  1 }
end
