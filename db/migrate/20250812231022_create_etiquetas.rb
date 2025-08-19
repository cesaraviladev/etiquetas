class CreateEtiquetas < ActiveRecord::Migration[8.0]
  def change
    create_table :etiquetas do |t|
      t.date :data_emissao
      t.string :tipo
      t.integer :quantidade
      t.boolean :isento

      t.timestamps
    end
  end
end
