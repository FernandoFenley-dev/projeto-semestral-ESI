#language: pt

Funcionalidade: Interface de visualização de serviços agendados - cliente
Como um cliente
Para que eu possa ver meus agendamentos do dia
Eu quero acessar a página de visualização de agendamentos

Cenário: Visualizar agendamentos - sem agendamentos
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
Quando eu for redirecionado para a página de dashboard
Então deverei ver a mensagem "Você não tem nenhum agendamento futuro neste dia"


Cenário: Visualizar agendamentos - com agendamentos
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
E que eu agendei "2" serviços para o dia
Quando eu for redirecionado para a página de dashboard
Então eu devo ver uma lista de agendamentos do dia
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento