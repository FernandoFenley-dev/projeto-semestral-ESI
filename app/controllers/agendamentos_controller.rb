class AgendamentosController < ApplicationController
    def new
        @usuarios = Usuario.where(iscliente: true)
        @servicos = Array["Cabelo", "Barba", "Cabelo e Barba"]
        @agendamento = Agendamento.new
    end

    def create
        @agendamento = Agendamento.new(agendamento_params)
        #@agendamento.idCliente=session[:usuario_id]
        @agendamento.cliente_id=session[:idUsuario]
        logger.debug "Aqui: #{@agendamento}"

        if @agendamento.save
            puts "SUCESSO"
            redirect_to @agendamento
        else
            @usuarios = Usuario.where(iscliente: true)
            @servicos = Array["Cabelo", "Barba", "Cabelo e Barba"]
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
        @agendamentos = Agendamento.where("barbeiro_id = :idBarbeiro 
            AND date(dataAgendamento) in (:data)",
            idBarbeiro: params[:idBarbeiro],
            data: params[:data]
        )
        logger.debug "ENTREIIIII"
        logger.debug "Article should be valid: #{params[:data]}"
        logger.debug "Aqui: #{session[:idUsuario]}"
        logger.debug "Aqui2: #{DateTime.current()}"
        logger.debug "Article should be valid: #{Usuario.column_names}"
        logger.debug "Article should be valid: #{Agendamento.column_names}"
        
    end

    private
    def agendamento_params
        params.require(:agendamento).permit(:cliente_id, :barbeiro_id, :nomeServico, :dataAgendamento)
    end

end
