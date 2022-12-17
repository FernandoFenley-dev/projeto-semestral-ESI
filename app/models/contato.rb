class Contato < ApplicationRecord
  validates :nome, presence: { message: "Digite seu nome!" }
  validates :email, presence: { message: "Digite seu email!" },format: { with: URI::MailTo::EMAIL_REGEXP,
      message: "Email inválido!" }
  validates :mensagem, presence: { message: "Escreva sua mensagem!" }
end
