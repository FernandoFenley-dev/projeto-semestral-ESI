class DropColumnNomeServico < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendamentos, :nomeServico
  end
end
