class DashboardController < ApplicationController
    before_action :require_user_logged_in!
    def index
        # Recupera todos os agendamentos do usuário logado, caso seja um cliente. Só são recuperados agendamentos em que a data de agendamento (inclusive a hora) seja maior ou igual a data (hora) atual. E menor que o final do dia atual.
        
        if Current.usuario.iscliente
            @agendamentos = Agendamento.where("cliente_id = ? AND data_agendamento >= ? AND data_agendamento < ?", Current.usuario.id, DateTime.now, DateTime.now.end_of_day).order(data_agendamento: :asc)

            @proximo_agendamento = @agendamentos.first

            @agendamentos = @agendamentos.where.not(id: @proximo_agendamento.id) if @proximo_agendamento
        end
    end
end