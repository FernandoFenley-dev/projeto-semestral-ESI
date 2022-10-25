class BarbeirosController < ApplicationController
    def new
      @barbeiros = Barbeiro.new
    end
  
    def create
      @barbeiros = Barbeiro.new(barbeiros_params)
      if @barbeiros.save
        redirect_to @barbeiros
      else
        render :new, status: :unprocessable_entity, content_type: "text/html"
        headers["Content-Type"] = "text/html"
      end
    end
  
    def show
      @barbeiros = Barbeiro.find(params[:id])
    end
  
    private
    def barbeiros_params
      params.require(:barbeiro).permit(:nome, :email, :senha)
    end
  
  end
  