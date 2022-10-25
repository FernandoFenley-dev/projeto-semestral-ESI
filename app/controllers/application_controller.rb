class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessoesHelper

  def autorizar
    unless logado?
      redirect_to root_url
    end
  end

  def checa_usuario
    @usuario = Usuario.find(params[:id])
    unless @usuario == usuario_atual
      redirect_to usuarios_path
    end
  end
 
end
