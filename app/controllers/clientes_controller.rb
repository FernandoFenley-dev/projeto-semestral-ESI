class ClientesController < ApplicationController
  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      redirect_to @cliente
    else
      render :new, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

    def show
    @cliente = Cliente.find(params[:id])
  end

  private
  def cliente_params
    params.require(:cliente).permit(:nome, :email, :senha)
  end

end
