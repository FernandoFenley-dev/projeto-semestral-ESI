class UsuariosController < ApplicationController
  before_action :require_user_logged_in!, except: [:new, :create]

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      logar(@usuario)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    @usuario.updating = true
    
    if @usuario.update(usuario_params)
      # Mensagem de sucesso
      flash[:success] = "Perfil atualizado com sucesso!"
      redirect_to root_path
    else
      flash[:danger] = "Erro ao atualizar perfil"
      render :edit, status: :unprocessable_entity, content_type: "text/html"
      headers["Content-Type"] = "text/html"
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    logout
    redirect_to root_path
  end

  def img
    @usuario = Usuario.find(session[:usuario_id])
    logger.debug "Person attributes hash: #{params[:id]}"
    @usuario.updating = false
    @usuario.update(profile_image: params[:id]);
    redirect_to '/'
  end

  private
  
  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :iscliente)
  end
end
