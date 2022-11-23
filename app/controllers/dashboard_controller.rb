class DashboardController < ApplicationController
    before_action :require_user_logged_in!
    def index
        # Recupera todos os agendamentos do usuário logado, caso seja um cliente. Só são recuperados agendamentos em que a data de agendamento seja maior ou igual a data atual.
        
        if Current.usuario.iscliente
            # Primeiro pega o próximo agendamento do cliente
            @proximo_agendamento = Agendamento.where("cliente_id = :cliente_id AND data_agendamento >= :data_agendamento", cliente_id: Current.usuario.id, data_agendamento: Date.today).order(data_agendamento: :asc).first

            # Pega os agendamentos restantes
            @agendamentos = Agendamento.where("cliente_id = :cliente_id AND data_agendamento >= :data_agendamento", cliente_id: Current.usuario.id, data_agendamento: Date.today).order(data_agendamento: :asc).offset(1)
        
        end
    end
end