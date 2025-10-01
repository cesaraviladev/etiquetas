class AddTenantToEtiquetas < ActiveRecord::Migration[8.0]
  def change
    add_reference :etiquetas, :tenant, foreign_key: true
  end
end
