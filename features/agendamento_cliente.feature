#language: pt

Funcionalidade: Agendamento cliente
Como cliente
Para que eu possa agendar um horário com o cabeleleiro
Eu quero escolher data, horário e cabeleleiro

Cenário: Agendamento de serviço com sucesso
Dado que estou na página de agendamento de serviço
Dado que existe um barbeiro cadastrado
Dado que estou na página de agendamento de serviço
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2023"
E clico em Agendar
Então o Agendamento deve ter sido salvo no banco de dados

Cenário: Agendamento de serviço com sucesso
Dado que existe um barbeiro cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2023"
E clico em Agendar
Então deverei ver o nome correspondente ao id "1"

Cenário: Agendamento de serviço sem idBarbeiro
Dado que existe um barbeiro cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o ano "2023"
Quando seleciono o barbeiro "teste"
E clico em Agendar
Então deverei ver a mensagem de erro "Digite o nome do Barbeiro!"


Cenário: Agendamento de serviço com dataAgendamento inválido
Dado que existe um barbeiro cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2021"
E clico em Agendar
Então deverei ver a mensagem de erro "A data agendada precisa ser no futuro!"


Cenário: Agendamento de serviço com dataAgendamento inválido
Dado que existe um barbeiro cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2024"
E clico em Agendar
Então deverei ver a mensagem de erro "A data agendada precisa ser em até um ano!"

