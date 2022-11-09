#language: pt

Funcionalidade: Agendamento cliente
Como cliente
Para que eu possa agendar um horário com o cabeleleiro
Eu quero escolher data, horário e cabeleleiro

Cenário: Agendamento de serviço com sucesso
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2023"
E clico em Agendar
Então o Agendamento deve ter sido salvo no banco de dados

Cenário: Ver nome do barbeiro após salvar o agendamento na tela de servico agendado
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2023"
E clico em Agendar
Então deverei ver o nome de barbeiro "teste"


Cenário: Agendamento de serviço sem escolher barbeiro
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o ano "2023"
E clico em Agendar
Então deverei ver a mensagem de erro "Digite o nome do Barbeiro!"


Cenário: Agendamento de serviço com dataAgendamento inválido, data no passado
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2021"
E clico em Agendar
Então deverei ver a mensagem de erro "A data agendada precisa ser no futuro!"


Cenário: Agendamento de serviço com dataAgendamento inválido, data a mais de um ano no futuro
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2024"
E clico em Agendar
Então deverei ver a mensagem de erro "A data agendada precisa ser em até um ano!"

