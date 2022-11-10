class SessoesController < ApplicationController
  # before_action :bloquear_acesso, except: [:destroy]
  def new; end

  def create
      usuario = Usuario.find_by(email: params[:email])
      if usuario.present? && usuario.authenticate(params[:password])
          logar(usuario)
          redirect_to root_path
      else
          # Cria variável de erro
          redirect_to root_path, notice: "Usuário ou senha inválidos"
      end
  end

  def destroy
      logout
      redirect_to root_path, notice: "Usuário deslogado com sucesso"
  end
end
