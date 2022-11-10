class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :seta_usuario_atual
  before_action :seta_usuario_atual
  helper_method :logado?

  def seta_usuario_atual
    Current.usuario = Usuario.find_by(id: session[:usuario_id]) if session[:usuario_id]
  end

  def require_user_logged_in!
    redirect_to login_path if Current.usuario.nil?
  end

  def logar(usuario)
    session[:usuario_id] = usuario.id
    session[:isBarbeiro] = usuario.iscliente
  end

  def logout
    session[:usuario_id] = nil
    session[:isBarbeiro] = nil
  end
 
end
