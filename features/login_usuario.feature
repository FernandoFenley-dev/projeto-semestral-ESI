#language: pt

Funcionalidade: Login
Como usuario
Para acessar a plataforma
Eu quero realizar o login na mesma

Cenário: Login na plataforma com sucesso
Dado que estou na página inicial
Quando preencho o campo "email" com "emailteste@gmail.com"
Quando preencho o campo "password" com "123senha"
E clico em Login
Entao devo ser redirecionado para a tela de perfil

Cenário: Login na plataforma com falha - email incorreto
Dado que estou na página inicial
Quando preencho o campo "email" com "emailtest@gmail.com"
Quando preencho o campo "password" com "123senha"
E clico em Login
Então deverei ver a mensagem de erro "Usuário ou senha inválidos"

Cenário: Login na plataforma com falha - senha incorreta
Dado que estou na página inicial
Quando preencho o campo "email" com "emailteste@gmail.com"
Quando preencho o campo "password" com "123senh"
E clico em Login
Então deverei ver a mensagem de erro "Usuário ou senha inválidos"
