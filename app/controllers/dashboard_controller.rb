class DashboardController < ApplicationController
    before_action :require_user_logged_in!
    def index
        # Recupera todos os agendamentos do usuário logado, caso seja um cliente. Só são recuperados agendamentos em que a data de agendamento (inclusive a hora) seja maior ou igual a data (hora) atual.
        
        if Current.usuario.iscliente
            # Primeiro pega o próximo agendamento do cliente
            @proximo_agendamento = Agendamento.where("cliente_id = ? AND data_agendamento >= ?", Current.usuario.id, DateTime.now).order(data_agendamento: :asc).first

            # Recupera os agendamentos restantes
            @agendamentos = Agendamento.where("cliente_id = ? AND data_agendamento >= ?", Current.usuario.id, DateTime.now).order(data_agendamento: :asc).offset(1)
        end
    end
end