class AgendamentosController < ApplicationController
    def new
        @agendamento = Agendamento.new
    end

    def create
        @agendamento = Agendamento.new(agendamento_params)
        @agendamento.nomeCliente="Cliente"#todo alterar para o nome do cliente, ou id do cliente logado

        if @agendamento.save
            puts "SUCESSO"
            redirect_to @agendamento
        else
            puts "ERROR"
            render :new, status: :unprocessable_entity, content_type: "text/html"
            headers["Content-Type"] = "text/html"
        end
      
    end

    def show
        @agendamento = Agendamento.find(params[:id])
    end

    def barbeador
        ##Book.where("created_at >= :start_date AND created_at <= :end_date",
        ##{start_date: params[:start_date], end_date: params[:end_date]})   
        @agendamentos = Agendamento.where("UPPER(nomeBarbeiro) = UPPER(:nomeBarbeiro)",
            nomeBarbeiro: params[:nomeBarbeiro]
        )
        logger.debug "ENTREIIIII"
        logger.debug "Article should be valid: #{params[:nomeBarbeiro]}"
        logger.debug "Article should be valid: #{Usuario.column_names}"
        logger.debug "Article should be valid: #{Agendamento.column_names}"
        
    end

    private
    def agendamento_params
        params.require(:agendamento).permit(:nomeCliente, :nomeBarbeiro, :nomeServico,:dataAgendada)
    end

end
