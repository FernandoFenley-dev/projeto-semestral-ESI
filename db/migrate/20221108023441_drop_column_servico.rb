class DropColumnServico < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendamentos, :idServico
  end
end
