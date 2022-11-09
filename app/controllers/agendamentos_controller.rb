class AgendamentosController < ApplicationController
    def new
        @barbeiros = Usuario.where("iscliente = 0")
        @barbeirosDDL = @barbeiros.pluck(:nome,:id)

        @agendamento = Agendamento.new
    end

    def create
        @agendamento = Agendamento.new(agendamento_params)
        #@agendamento.idCliente=session[:usuario_id]
        @agendamento.idCliente=1#todo alterar para session quando conseguir persistir o valor da session

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
        @barbeiro = Usuario.find(@agendamento.idBarbeiro)

    end

    private
    def agendamento_params
        params.require(:agendamento).permit(:idCliente, :idBarbeiro,:dataAgendamento)
    end

  
end
