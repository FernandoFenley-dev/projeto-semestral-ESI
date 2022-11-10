#language: pt

Funcionalidade: Alteracão de senha usuário
Como usuario
Para que eu possa acessar a plataforma novamente
Eu quero ser capaz de alterar minha senha

Cenário: Alteração de senha com sucesso
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
Dado que estou na página de edição de usuário
Quando preencho o campo "usuario[password]" com "123senha1"
E clico em Confirmar
Então o Usuario deve ter sido salvo no banco de dados
Então deverei ser redirecionado para a página raiz

Cenário: Alteração de senha sem preenchimento do campo senha
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
Dado que estou na página de edição de usuário
E deixo o campo "usuario[password]" vazio
E clico em Confirmar
Então deverei ver a mensagem de erro "Erro ao atualizar perfil"