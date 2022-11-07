class Agendamento < ApplicationRecord
    validates :idCliente, presence: { message: "Não possui nome do cliente!" }
    validates :idBarbeiro, presence: { message: "Digite o nome do Barbeiro!" }
    validates :idServico, presence: { message: "Digite o nome do Serviço!" }

    validate :valid_date?

    def valid_date?
        if dataAgendamento > DateTime.now.next_year(1).to_time
            errors.add(:dataAgendamento, "A data agendada precisa ser em até um ano!")
        end
        if dataAgendada < Date.current()
            errors.add(:dataAgendada, "A data agendada precisa ser no futuro!")
        end
      
    end
      
end
