class RemoveDefaultFromEtiquetasTipo < ActiveRecord::Migration[8.0]
  def change
    change_column_default :etiquetas, :tipo, nil
  end
end
