#language: pt

Funcionalidade: Recuperação de senha do usuário
Como usuario
Para que eu possa acessar a plataforma novamente
Eu quero ser capaz de alterar minha senha

Cenário: Recuperação de senha com sucesso
Dado que estou registrado no sistema
Dado que estou na página de recuperação de senha
Quando preencho o campo "email" com "teste@gmail.com"
E clico no botão Enviar email
Então deverei receber um email contendo o link para redefinição de senha

Cenário: Recuperação de senha sem preenchimento do campo email
Dado que estou registrado no sistema
Dado que estou na página de recuperação de senha
E deixo o campo "email" vazio
Então deverei ver o botão Enviar email desabilitado