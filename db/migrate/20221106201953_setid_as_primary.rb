class SetidAsPrimary < ActiveRecord::Migration[7.0]
  def change
    add_column :agendamentos, :id, :primary_key
  end
end
