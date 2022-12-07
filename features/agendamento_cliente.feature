#language: pt

Funcionalidade: Agendamento cliente
Como cliente
Para que eu possa agendar um horário com o cabeleleiro
Eu quero escolher data, horário e cabeleleiro

Cenário: Agendamento de serviço com sucesso
Dado que estou na página inicial
Quando preencho o campo "email" com "emailteste@gmail.com"
Quando preencho o campo "password" com "123senha"
E clico em Login
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
Então deverei ver a mensagem de erro "Selecione o Barbeiro!"


Cenário: Agendamento de serviço com data_agendamento inválido, data no passado
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2022"
E seleciono o mes "January"
E clico em Agendar
Então deverei ver a mensagem de erro "A data agendada precisa ser no futuro!"


Cenário: Agendamento de serviço com data_agendamento inválido, data a mais de um ano no futuro
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
Quando seleciono o ano "2023"
E seleciono o mes "December"
E seleciono o dia "30"
E clico em Agendar
Então deverei ver a mensagem de erro "A data agendada precisa ser em até um ano!"

Cenário: Horário já agendado para aquele barbeiro
Dado que existe um horario marcado pro barbeiro "teste"
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
E seleciono o ano "2023"
E seleciono o mes "December"
E seleciono o dia "6"
E seleciono a hora "10"
E seleciono o minuto "30"
E clico em Agendar
Então deverei ver a mensagem de erro "Já existe um agendamento para este barbeiro nessa data"

Cenário: Agendamento realizado com sucesso
Dado que existe um barbeiro chamado "teste" cadastrado
Dado que estou na página de agendamento de serviço
Quando seleciono o barbeiro "teste"
E seleciono o ano "2023"
E seleciono o mes "December"
E seleciono o dia "6"
E seleciono a hora "10"
E seleciono o minuto "30"
E clico em Agendar
Então deverei ver a mensagem "Agendamento realizado com sucesso"


