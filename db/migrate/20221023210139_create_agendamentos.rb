class CreateAgendamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :agendamentos do |t|
      t.string :idCliente
      t.string :idBarbeiro
      t.string :idServico
      t.datetime :dataAgendamento

      t.timestamps
    end
  end
end
