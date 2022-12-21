#language: pt

Funcionalidade: Interface de visualização de serviços agendados - barbeiro
Como um barbeiro
Para que eu possa ver quais clientes atenderei em um dia de trabalho
Eu quero ser capaz de acessar a minha agenda de trabalho 

Cenário: Acesso a agenda de trabalho
Dado que estou na página inicial para barbeiros
E clicar no botão Minha Agenda
Entao deverei ser redirecionado para a página de Serviços Agendados para o dia atual

Cenário: Acesso a agenda de trabalho sem agendamentos
Dado que estou na página de Serviços Agendados
E que não há agendamentos para este dia
Entao deverei ver a mensagem de aviso

Cenário: Altero a data da agenda para uma que contem agendamento
Dado que estou na página inicial para barbeiros
E clicar no botão Minha Agenda
Quando seleciono o ano do agendamento "2023"
Quando seleciono o mes do agendamento "Fevereiro"
Quando seleciono o dia do agendamento "2"
E clico em Alterar Data
Entao deverei ver a mensagem "February 02, 2023"


