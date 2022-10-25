class UsuariosController < ApplicationController
  before_action :checa_usuario, except: [:new, :create]
  def index
    @usuarios = Usuario.all
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to @usuario
      sign_in
    else
      render :new, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(usuario_params)
      redirect_to usuarios_path
    else
      render action: :edit
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    logout
    redirect_to root_path
  end

  private
  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :iscliente)
  end
end
