class Usuario < ActiveRecord::Base
    has_secure_password
    validates :nome, presence: { message: "Digite seu nome!" }, length: {maximum: 50} 
    validates :email, uniqueness: true, presence: { message: "Digite seu email!" },format: { with: URI::MailTo::EMAIL_REGEXP,
        message: "Email inválido!" }
    validates :password, presence: { message: "Crie uma senha!" }
    validates :iscliente, presence: { message: "Selecione se é cliente ou não!" }
end
