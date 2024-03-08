class CreateMunicipes < ActiveRecord::Migration[7.1]
  def change
    create_table :municipes do |t|
      t.string :nome_completo
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :data_nascimento
      t.string :telefone
      t.json :fotos
      t.boolean :status

      t.timestamps
    end
  end
end
