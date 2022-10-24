class Agendamento < ApplicationRecord
    validates :nomeCliente, presence: { message: "Não possui nome do cliente!" }
    validates :nomeBarbeiro, presence: { message: "Digite o nome do Barbeiro!" }
    validates :nomeServico, presence: { message: "Digite o nome do Serviço!" }

    validate :valid_date?

    def valid_date?
        if dataAgendada > DateTime.now.next_year(1).to_time
            errors.add(:dataAgendada, "A data agendada precisa ser em até um ano!")
        end
        if dataAgendada < Time.now
            errors.add(:dataAgendada, "A data agendada precisa ser no futuro!")
        end
      
    end
      
end
