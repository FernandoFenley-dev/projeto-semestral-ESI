class AgendamentosController < ApplicationController
  def new
    @barbeiros = Usuario.where(iscliente: false)
    @barbeirosDDL = @barbeiros.pluck(:nome, :id)

    @agendamento = Agendamento.new
  end

  def create
    @agendamento = Agendamento.new(agendamento_params)
    @agendamento.cliente_id = session[:usuario_id]


    if @agendamento.save
        redirect_to @agendamento
    else
        @usuarios = Usuario.where(iscliente: true)
        puts @agendamento.errors.full_messages

        render :new, status: :unprocessable_entity, content_type: "text/html"
        headers["Content-Type"] = "text/html"
    end
  end

  def show
    @agendamento = Agendamento.find(params[:id])
    @barbeiro = Usuario.find(@agendamento.barbeiro_id)
  end

  def barbeador
    if Rails.env.development? || Rails.env.test?
      @agendamentos = Agendamento.where("barbeiro_id = :barbeiro_id
                AND date(data_agendamento) in (:data)",
                                        barbeiro_id: params[:barbeiro_id],
                                        data: params[:data]
      )
    else
      @agendamentos = Agendamento.where("barbeiro_id = :barbeiro_id
                AND to_char(data_agendamento, 'yyyy-mm-dd') in (:data)",
                                        barbeiro_id: params[:barbeiro_id],
                                        data: params[:data]
      )
    end
    @agendamentos = @agendamentos.uniq.sort_by! { |obj| obj.data_agendamento unless obj.blank? }
  end

  def destroy
    @agendamento = Agendamento.find(params[:id])
    @agendamento.destroy
    redirect_to '/'
  end

  private

  def agendamento_params
    params.require(:agendamento).permit(:cliente_id, :barbeiro_id, :data_agendamento)
  end

end
