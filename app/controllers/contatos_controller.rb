class ContatosController < ApplicationController
  before_action :set_contato, only: %i[ show edit update destroy ]

  def index
    @contatos = Contato.all
  end

  # GET /contatos/1 or /contatos/1.json
  def show
  end

  def new
    @contato = Contato.new
  end

  # GET /contatos/1/edit
  def edit
  end

  def create
    @contato = Contato.new(contato_params)

    respond_to do |format|
      if @contato.save
        format.html { redirect_to contato_url(@contato), notice: "A mensagem foi enviada com sucesso!" }
        format.json { render :show, status: :created, location: @contato }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contato.update(contato_params)
        format.html { redirect_to contato_url(@contato), notice: "A mensagem foi editada com sucesso!" }
        format.json { render :show, status: :ok, location: @contato }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contato.destroy

    respond_to do |format|
      format.html { redirect_to contatos_url, notice: "A mensagem foi apagada com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    def set_contato
      @contato = Contato.find(params[:id])
    end

    def contato_params
      params.require(:contato).permit(:nome, :email, :mensagem)
    end
end
