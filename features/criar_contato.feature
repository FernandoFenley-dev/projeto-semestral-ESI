#language: pt

Funcionalidade: Criar contato
Como cliente
Para que eu possa enviar uma mensagem para a barbearia
Eu quero digitar meu nome, email e mensagem e enviar

Cenário: Contato feito com sucesso
Dado que estou logado como cliente
Dado que estou na página de criar contato
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Email" com "augusto.xavier@usp.br"
Quando preencho o campo "Mensagem" com "Gostaria de elogiar o barbeiro Clovis"
E clico em "Enviar mensagem"
Então a mensagem deve ter sido salva no banco de dados

Cenário: Contato feito sem nome
Dado que estou logado como cliente
Dado que estou na página de criar contato
Quando preencho o campo "Email" com "augusto.xavier@usp.br"
Quando preencho o campo "Mensagem" com "Gostaria de elogiar o barbeiro Clovis"
E clico em "Enviar mensagem"
Então deverei ver a mensagem de erro "Digite seu nome!"

Cenário: Contato feito sem email
Dado que estou logado como cliente
Dado que estou na página de criar contato
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Mensagem" com "Gostaria de elogiar o barbeiro Clovis"
E clico em "Enviar mensagem"
Então deverei ver a mensagem de erro "Digite seu email!"

Cenário: Contato feito sem mensagem
Dado que estou logado como cliente
Dado que estou na página de criar contato
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Email" com "augusto.xavier@usp.br"
E clico em "Enviar mensagem"
Então deverei ver a mensagem de erro "Escreva sua mensagem!"

Cenário: Contato feito com email inválido
Dado que estou logado como cliente
Dado que estou na página de criar contato
Quando preencho o campo "Nome" com "Augusto Xavier"
Quando preencho o campo "Email" com "augusto.xavier#2022"
Quando preencho o campo "Mensagem" com "Gostaria de elogiar o barbeiro Clovis"
E clico em "Enviar mensagem"
Então deverei ver a mensagem de erro "Email inválido!"

Cenário: Ver contatos realizados anteriormente
Dado que estou logado como cliente
Dado que realizei contato anteriormente
Dado que estou na página de contatos realizados
Então deverei ver a informação "Augusto Xavier"
Então deverei ver a informação "augusto.xavier@usp.br"
Então deverei ver a informação "Gostaria de elogiar o barbeiro Clovis"

Cenário: Atualizar mensagem enviada
Dado que estou logado como cliente
Dado que realizei contato anteriormente
Dado que estou na página de contatos realizados
E clico em "Abrir mensagem"
E clico em "Editar mensagem"
Quando preencho o campo "Mensagem" com "Gostaria de mudar minha mensagem, não gostei do Clovis"
E clico em "Enviar mensagem"
Então deverei ver a informação "Gostaria de mudar minha mensagem, não gostei do Clovis"

Cenário: Apagar mensagem enviada
Dado que estou logado como cliente
Dado que realizei contato anteriormente
Dado que estou na página de contatos realizados
E clico em "Abrir mensagem"
E clico em "Apagar mensagem"
Então deverei ver a informação "A mensagem foi apagada com sucesso!"
