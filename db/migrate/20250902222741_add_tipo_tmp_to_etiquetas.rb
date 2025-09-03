class AddTipoTmpToEtiquetas < ActiveRecord::Migration[8.0]
  def change
    add_column :etiquetas, :tipo_tmp, :integer, default: 0, null: false
  end
end
