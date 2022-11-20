#language: pt

Funcionalidade: Barra de navegação superior
Como usuario
Para que eu possa navegar pela plataforma
Eu quero ter uma barra de navegação superior

Cenário: Usar a barra de navegação para navegar para a página de Agendamento de serviço - cliente
Dado que estou registrado no sistema
Dado que eu estou logado no sistema
Quando eu for redirecionado para a página de dashboard
Então deverei visualizar a barra de navegação superior
Então a barra de navegação deve conter links para as páginas "Meus agendamentos" e "Agendar serviço"
Quando eu clicar no link "Agendar serviço"
Então deverei ser redirecionado para a página "Agendar serviço"

Cenário: Usar a barra de navegação para navegar para a página de Agendamento de serviço - barbeiro
Dado que estou registrado no sistema como barbeiro
Dado que eu estou logado no sistema como barbeiro
Quando eu for redirecionado para a página de dashboard
Então deverei visualizar a barra de navegação superior
E a barra de navegação deve conter links para as páginas "Dashboard" e "Minha agenda"
Quando eu clicar no link "Minha agenda"
Então deverei ser redirecionado para a página "Minha agenda"
