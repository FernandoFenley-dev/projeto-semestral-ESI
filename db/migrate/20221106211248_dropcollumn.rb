class Dropcollumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :agendamentos, :id
  end
end
