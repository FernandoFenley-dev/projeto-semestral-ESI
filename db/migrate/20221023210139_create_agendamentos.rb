class CreateAgendamentos < ActiveRecord::Migration[7.0]
  def change
    create_table :agendamentos do |t|
      t.string :nomeCliente
      t.string :nomeBarbeiro
      t.string :nomeServico
      t.datetime :dataAgendada

      t.timestamps
    end
  end
end
