class RemoveAgendamentosForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :agendamentos, :usuarios, column: :id
  end
end
