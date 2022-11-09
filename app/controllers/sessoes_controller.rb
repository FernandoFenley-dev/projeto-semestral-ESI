class SessoesController < ApplicationController
  before_action :bloquear_acesso, except: [:destroy]
    def create
        @usuario = Usuario.find_by(email: params[:session][:email])
        if @usuario && @usuario.authenticate(params[:session][:password])
          session[:idUsuario] = @usuario.id
          session[:isBarbeiro] = @usuario.iscliente
          logger.debug "Article should be valid: #{session[:isBarbeiro]}"
          sign_in 
          redirect_to @usuario
        else
          # Cria variável de erro
          redirect_to root_url, notice: "Usuário ou senha inválidos"
        end
    end

    def destroy
        logout
        redirect_to root_url
    end
end