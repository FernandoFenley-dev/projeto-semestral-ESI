class CreateContatos < ActiveRecord::Migration[7.0]
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :email
      t.string :mensagem

      t.timestamps
    end
  end
end
