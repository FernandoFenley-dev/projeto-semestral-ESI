#language: pt

Funcionalidade: Recuperação de senha do usuário
Como usuario
Para que eu possa acessar a plataforma novamente
Eu quero ser capaz de alterar minha senha

Cenário: Recuperação de senha com sucesso
Dado que estou registrado no sistema
Dado que estou na página de recuperação de senha
Dado que existe um cliente chamado "teste" cadastrado
Quando preencho o campo "email" com "cliente@teste.com"
E clico no botão Enviar email
Então deverei ver a mensagem "Email enviado com sucesso!"



Cenário: Recuperação de senha sem preenchimento do campo email
Dado que estou registrado no sistema
Dado que estou na página de recuperação de senha
E deixo o campo "email" vazio
Então deverei ver a mensagem "Por favor, insira seu endereço de email. Enviaremos um email para que possa recuperar sua senha"
