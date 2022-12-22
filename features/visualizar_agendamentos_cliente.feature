#language: pt

Funcionalidade: Interface de visualização de serviços agendados - cliente
Como um cliente
Para que eu possa ver meus agendamentos do dia
Eu quero acessar a página de visualização de agendamentos

Cenário: Visualizar agendamentos - sem agendamentos
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
Quando eu for redirecionado para a página de dashboard
Então deverei ver a mensagem "Você não tem nenhum agendamento neste dia"


Cenário: Visualizar agendamentos - com agendamentos
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
E que eu agendei "2" serviços para a data "23/12/2022" e horários a partir das "10:00" até as "17:00"
Quando eu for redirecionado para a página de dashboard
Quando eu clicar no dia "2022-12-23"
Então eu devo ver uma lista de agendamentos da data "23/12/2022"
E a lista deve conter "2" agendamentos
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
E os horários dos agendamentos devem ser até as "17:00" horas
Então não deverei ver a mensagem "Você não tem nenhum agendamento neste dia"