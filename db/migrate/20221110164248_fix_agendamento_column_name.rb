class FixAgendamentoColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :agendamentos, :dataAgendamento, :data_agendamento
  end
end
