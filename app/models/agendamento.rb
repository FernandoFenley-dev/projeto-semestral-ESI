class Agendamento < ActiveRecord::Base

    belongs_to :cliente, class_name: 'Usuario'
    belongs_to :barbeiro, class_name: 'Usuario'

    validates :cliente_id, presence: { message: "Não possui i nome do cliente!" }
    validates :barbeiro_id, presence: { message: "Selecione o Barbeiro!" }


    validate :valid_date?

    def valid_date?
        if dataAgendamento > DateTime.now.next_year(1).to_time
            errors.add(:dataAgendamento, "A data agendada precisa ser em até um ano!")
        end
        if dataAgendamento < Date.current()
            errors.add(:dataAgendamento, "A data agendada precisa ser no futuro!")
        end
      
    end
      
end
