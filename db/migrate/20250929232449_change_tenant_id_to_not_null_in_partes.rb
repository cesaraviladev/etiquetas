class ChangeTenantIdToNotNullInPartes < ActiveRecord::Migration[8.0]
  def change
    change_column_null :partes, :tenant_id, false
  end
end
