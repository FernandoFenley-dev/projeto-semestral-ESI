#language: pt

Funcionalidade: Cadastrar barbeiro
Eu como barbeiro
Para que eu possa visualizar meus horários agendados
Eu quero me cadastrar no banco de dados

Cenário: succeso no cadastro de um barbeiro
Dado que estou na página de cadastro de barbeiro
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Email" com "guilherme.jimenes@usp.br"
Quando preencho o campo "Senha" com "@Senha123"
E clico em Cadastrar
Então ele deve ter sido salvo no banco de dados

Cenário: Cadastro de barbeiro sem nome
Dado que estou na página de cadastro de barbeiro
Quando preencho o campo "Email" com "guilherme.jimenes@usp.br"
Quando preencho o campo "Senha" com "@Senha123"
E deixo o campo "Nome" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Digite seu nome!"

Cenário: Cadastro de barbeiro sem email
Dado que estou na página de cadastro de barbeiro
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Senha" com "@Senha123"
E deixo o campo "Email" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Digite seu email!"

Cenário: Cadastro de barbeiro sem senha
Dado que estou na página de cadastro de barbeiro
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Email" com "guilherme.jimenes@usp.br"
E deixo o campo "Senha" vazio
E clico em Cadastrar
Então deverei ver a mensagem de erro "Crie uma senha!"

Cenário: Cadastro de barbeiro com email inválido
Dado que estou na página de cadastro de barbeiro
Quando preencho o campo "Nome" com "Guilherme Jimenes"
Quando preencho o campo "Senha" com "@Senha123"
E preencho o campo "Email" com "guilherme.com"
E clico em Cadastrar
Então deverei ver a mensagem de erro "Email inválido!"