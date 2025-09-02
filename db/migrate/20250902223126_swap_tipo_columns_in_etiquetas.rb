class SwapTipoColumnsInEtiquetas < ActiveRecord::Migration[8.0]
  def change
    remove_column :etiquetas, :tipo, :string
    rename_column :etiquetas, :tipo_tmp, :tipo
  end
end
