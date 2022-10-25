class SessoesController < ApplicationController
  before_action :bloquear_acesso, except: [:destroy]
    def create
        @usuario = Usuario.find_by(email: params[:session][:email].downcase)
        if @usuario && @usuario.authenticate(params[:session][:password])
          sign_in 
          redirect_to @usuario
        else
          render 'new'
        end
    end

    def destroy
        logout
        redirect_to root_url
    end
end