class AgendamentosController < ApplicationController
    def new
        @barbeiros = Usuario.where("iscliente = 0")
        @barbeirosDDL = @barbeiros.pluck(:nome,:id)

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
        @barbeiro = Usuario.find(@agendamento.idBarbeiro)

    end

    def barbeador
        @agendamentos = Agendamento.where("barbeiro_id = :idBarbeiro 
            AND date(dataAgendamento) in (:data)",
            idBarbeiro: params[:idBarbeiro],
            data: params[:data]
        )
        #logger.debug "ENTREIIIII"
        #logger.debug "Article should be valid: #{params[:data]}"
        #logger.debug "Aqui: #{session[:idUsuario]}"
        #logger.debug "Aqui2: #{DateTime.current()}"
        #logger.debug "Article should be valid: #{Usuario.column_names}"
        #logger.debug "Article should be valid: #{Agendamento.column_names}"
        
    end

    private
    def agendamento_params
        params.require(:agendamento).permit(:idCliente, :idBarbeiro,:dataAgendamento)
    end

end
