class DashboardController < ApplicationController
    before_action :require_user_logged_in!
    def index
        # Adiciona as variáveis para o componente de calendário
        @data = params[:data] ? Date.parse(params[:data]) : Date.today

        # Recupera todos os agendamentos do mês do usuário logado, caso seja um cliente. Só são recuperados agendamentos em que a data de agendamento (inclusive a hora) seja maior ou igual a data (hora) atual. E menor que a data (hora) do fim do mês.
        if Current.usuario.iscliente
            @agendamentos = Agendamento.where("cliente_id = ? AND data_agendamento >= ? AND data_agendamento < ?", Current.usuario.id, Date.today.beginning_of_month, Date.today.end_of_month).order(data_agendamento: :asc)
        
            # @agendamentos = Agendamento.where("cliente_id = ? AND data_agendamento >= ? AND data_agendamento < ?", Current.usuario.id, DateTime.now, DateTime.now.end_of_day).order(data_agendamento: :asc)

            # @agendamentos = @agendamentos.where.not(id: @proximo_agendamento.id) if @proximo_agendamento

            @datas_agendamentos = @agendamentos.map { |agendamento| agendamento.data_agendamento.strftime("%Y-%m-%d") }

            @agendamentos_dia = @agendamentos.where(data_agendamento: @data.beginning_of_day..@data.end_of_day)

            @proximo_agendamento = @agendamentos_dia.first

            @agendamentos_dia = @agendamentos_dia.where.not(id: @proximo_agendamento.id) if @proximo_agendamento
        end

        
    end
end