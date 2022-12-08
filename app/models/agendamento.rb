class Agendamento < ActiveRecord::Base

    belongs_to :cliente, class_name: 'Usuario'
    belongs_to :barbeiro, class_name: 'Usuario'

    validates :cliente_id, presence: { message: "Não possui o cliente!" }
    validates :barbeiro_id, presence: { message: "Selecione o Barbeiro!" }

    validate :valid_date?

    def valid_date?
        if data_agendamento > DateTime.now.next_year(1).to_time
            errors.add(:data_agendamento, "A data agendada precisa ser em até um ano!")
        end
        if data_agendamento < Date.current()
            errors.add(:data_agendamento, "A data agendada precisa ser no futuro!")
        end

        # Checa se a data escolhida é pelo menos 10 minutos maior que o DateTime atual
        if  data_agendamento < DateTime.now + 9.minutes
            errors.add(:data_agendamento, "A data agendada (horário) precisa ser no mínimo 10 minutos maior que a atual!")
        end

        if Rails.env.development? || Rails.env.test?

            @agendamentos = Agendamento.where("barbeiro_id = :barbeiro_id
                      AND data_agendamento in (:data)",
                                              barbeiro_id: barbeiro_id,
                                              data: data_agendamento
            )
          else

            @agendamentos = Agendamento.where("barbeiro_id = :barbeiro_id
                      AND to_char(data_agendamento, 'yyyy-mm-dd hh\:mm\:ss') in (:data)",
                                              barbeiro_id: barbeiro_id,
                                              data: data_agendamento
            )
        end
        if @agendamentos.length >0
            errors.add(:data_agendamento, "Já existe um agendamento para este barbeiro nessa data")
        end

    end
end
