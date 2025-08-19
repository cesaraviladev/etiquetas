class CreatePartes < ActiveRecord::Migration[8.0]
  def change
    create_table :partes do |t|
      t.string :nome
      t.string :cpf
      t.references :etiqueta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
