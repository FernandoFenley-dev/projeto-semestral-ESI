class DropAgendamentos < ActiveRecord::Migration[7.0]
  def change
    drop_table :agendamentos
  end
end
