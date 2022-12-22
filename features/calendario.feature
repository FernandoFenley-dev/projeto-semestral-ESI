#language: pt

Funcionalidade: Calendário de agendamentos
Como um cliente
Para que eu possa ver meus agendamentos
Eu quero visualizar um calendário com todos os meus agendamentos

Cenário: Visualizar agendamentos - sem agendamentos no calendário
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
Quando eu for redirecionado para a página de dashboard
E eu clicar em algum dia do calendário
Então deverei ver a mensagem "Você não tem nenhum agendamento neste dia"
E os itens do calendário não devem conter links para os agendamentos

Cenário: Visualizar agendamentos - com agendamentos no calendário e somente um agendamento no dia
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
E que eu agendei "1" serviços para o dia
Quando eu for redirecionado para a página de dashboard
Quando eu clicar no dia que eu agendei
Então eu devo ver uma lista de agendamentos do dia
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
Então deverei ver a mensagem "Você não tem próximos agendamentos neste dia"

Cenário: Visualizar agendamentos - com agendamentos no calendário e mais de um agendamento no dia
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
E que eu agendei "3" serviços para o dia
Quando eu for redirecionado para a página de dashboard
E eu clicar no dia que eu agendei
Então eu devo ver uma lista de agendamentos do dia
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
Então não deverei ver a mensagem "Você não tem próximos agendamentos neste dia"

Cenário: Visualizar agendamentos - com agendamentos no calendário e mais de um agendamento em dias diferentes
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
E que eu agendei "3" serviços para a data "22/12/2022" e horários a partir das "10:00" até as "15:00"
E que eu agendei "3" serviços para a data "25/12/2022" e horários a partir das "10:00" até as "15:00"
Quando eu for redirecionado para a página de dashboard
Quando eu clicar no dia "2022-12-22"
Então eu devo ver uma lista de agendamentos da data "22/12/2022"
E a lista deve conter "3" agendamentos
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
E os horários dos agendamentos devem ser até as "15:00" horas
Quando eu clicar no dia "2022-12-25"
Então eu devo ver uma lista de agendamentos da data "25/12/2022"
E a lista deve conter "3" agendamentos
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
E os horários dos agendamentos devem ser até as "15:00" horas



Cenário: Visualizar agendamentos - com agendamentos no calendário e os agendamentos são de outro mês
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
E que eu agendei "2" serviços para a data "22/12/2022" e horários a partir das "10:00" até as "15:00"
E que eu agendei "4" serviços para a data "25/03/2023" e horários a partir das "10:00" até as "15:00"
Quando eu for redirecionado para a página de dashboard
Quando eu clicar no dia "2022-12-22"
Então eu devo ver uma lista de agendamentos da data "22/12/2022"
E a lista deve conter "2" agendamentos
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
E os horários dos agendamentos devem ser até as "15:00" horas
Quando eu visualizar o calendário do mês "2023-03"
Quando eu clicar no dia "2023-03-25"
Então eu devo ver uma lista de agendamentos da data "25/03/2023"
E a lista deve conter "4" agendamentos
E cada agendamento deve conter o nome do barbeiro e o horário do agendamento
E os horários dos agendamentos devem ser até as "15:00" horas
