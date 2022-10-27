class Usuario < ActiveRecord::Base
    has_secure_password

    attr_accessor :updating

    def should_validate_iscliente?
        !updating || new_record?
    end

    validates :nome, presence: { message: "Digite seu nome!" }, length: {maximum: 50} 
    validates :email, uniqueness: true, presence: { message: "Digite seu email!" },format: { with: URI::MailTo::EMAIL_REGEXP,
        message: "Email inválido!" }
    validates :password, presence: { message: :updating ? "Confirme sua senha" : "Crie uma senha" }
    # validates :iscliente, presence: { message: "Selecione se é cliente ou não!" }, if: :should_validate_iscliente? - Apresenta erro para quando seleciona barbeiro (false)
end
