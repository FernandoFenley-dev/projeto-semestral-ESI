class DropAndCreateTableAgendamentos < ActiveRecord::Migration[7.0]
  def change
    drop_table:agendamentos
    create_table :agendamentos do |t|

      t.string :nomeServico
      t.datetime :dataAgendamento
      
      t.timestamps

      t.references :cliente, null: false
      t.references :barbeiro, null: false
    end

    add_foreign_key :agendamentos, :usuarios, column: :id
    add_foreign_key :agendamentos, :usuarios, column: :id
  end
end
