class Cliente < ApplicationRecord
  validates :nome, presence: { message: "Digite seu nome!" }
  validates :email, uniqueness: true, presence: { message: "Digite seu email!" },format: { with: URI::MailTo::EMAIL_REGEXP,
      message: "Email inválido!" }
  validates :senha, presence: { message: "Crie uma senha!" }

end
