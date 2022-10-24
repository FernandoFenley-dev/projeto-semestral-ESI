class Barbeiro < ApplicationRecord
    validates :nome, presence: { message: "Digite seu nome! - Barbeiro" }
    validates :email, uniqueness: true, presence: { message: "Digite seu email! - Barbeiro" },format: { with: URI::MailTo::EMAIL_REGEXP,
        message: "Email inválido! - Barbeiro" }
    validates :senha, presence: { message: "Crie uma senha! - Barbeiro" }
  
  end
  