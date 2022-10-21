#language: pt

Funcionalidade: Cadastrar clientes
Como cliente
Para que eu possa agendar um horário com o cabeleleiro
Eu quero cadastrar meus dados no banco dados

Cenário: Cadastro de cliente com sucesso
Dado que estou na página de cadastro de cliente
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Email" com "augusto.xavier@usp.br"
Quando preencho o campo "Senha" com "senhaforte123"
E clico em Cadastrar
Então ele deve ter sido salvo no banco de dados

Cenário: Cadastro de cliente sem nome
Dado que estou na página de cadastro de cliente
Quando preencho o campo "Email" com "augusto.xavier@usp.br"
Quando preencho o campo "Senha" com "senhaforte123"
E deixo o campo "Nome" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Digite seu nome!"

Cenário: Cadastro de cliente sem email
Dado que estou na página de cadastro de cliente
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Senha" com "senhaforte123"
E deixo o campo "Email" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Digite seu email!"

Cenário: Cadastro de cliente sem senha
Dado que estou na página de cadastro de cliente
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Email" com "augusto.xavier@usp.br"
E deixo o campo "Senha" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Crie uma senha!"

Cenário: Cadastro de cliente com email inválido
Dado que estou na página de cadastro de cliente
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Senha" com "senhaforte123"
E preencho o campo "Email" com "augusto.xavier#2022"
E clico em Cadastrar
Então deverei ver a mensagem de erro "Email inválido!"