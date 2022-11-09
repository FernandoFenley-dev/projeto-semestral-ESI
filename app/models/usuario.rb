class Usuario < ActiveRecord::Base
    has_secure_password

    has_many :cliente_agendamento, class_name: 'Agendamento', 
    foreign_key: 'cliente_id'
    
    has_many :barbeiro_agendamento, class_name: 'Agendamento',
    foreign_key: 'barbeiro_id'

    attr_accessor :updating

    def should_validate_iscliente?
        !updating || new_record?
    end

    validates :nome, presence: { message: "Digite seu nome!" }, length: {maximum: 50} 
    validates :email, uniqueness: true, presence: { message: "Digite seu email!" },format: { with: URI::MailTo::EMAIL_REGEXP,
        message: "Email inválido!" }
    validates :password, presence: { message: :updating ? "Confirme sua senha" : "Crie uma senha" }
    validates :iscliente, inclusion: { in: [ true, false ] }
end
