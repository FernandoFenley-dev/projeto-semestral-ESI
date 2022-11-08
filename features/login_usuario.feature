#language: pt

Funcionalidade: Login
Como usuario
Para acessar a plataforma
Eu quero realizar o login na mesma

Cenário: Login na plataforma
Dado que estou na página inicial
Quando preencho o campo "email" com "emailteste@gmail.com"
Quando preencho o campo "password" com "123senha"
E clico em Login
Entao devo ser redirecionado para a tela de perfil
