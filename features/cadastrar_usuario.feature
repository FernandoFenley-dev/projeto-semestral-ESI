#language: pt

Funcionalidade: Cadastrar usuarios
Como usuario
Para que eu possa agendar um horário com o cabeleleiro
Eu quero cadastrar meus dados no banco dados

Cenário: Cadastro de usuario com sucesso
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Email" com "guilherme.jimenes@usp.br"
Quando preencho o campo "Password" com "Password22@"
E clico em Cadastrar
Então ele deve ter sido salvo no banco de dados

Cenário: Cadastro de usuario sem nome
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Email" com "guilherme.jimenes@usp.br"
Quando preencho o campo "Password" com "Password22@"
E deixo o campo "Nome" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Digite seu nome!"

Cenário: Cadastro de usuario sem email
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Password" com "Password22@"
E deixo o campo "Email" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Digite seu email!"

Cenário: Cadastro de usuario sem Password
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Email" com "guilherme.jimenes@usp.br"
E deixo o campo "Password" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Password can't be blank"

Cenário: Cadastro de usuario com email inválido
Dado que estou na página de cadastro de usuario
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Password" com "Password22@"
E preencho o campo "Email" com "guilherme.jimenes.br"
E clico em Cadastrar
Então deverei ver a mensagem de erro "Email inválido!"