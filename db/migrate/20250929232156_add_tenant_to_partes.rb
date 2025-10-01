class AddTenantToPartes < ActiveRecord::Migration[8.0]
  def change
    add_reference :partes, :tenant, null: true, foreign_key: true
  end
end
