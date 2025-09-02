class MigrateTipoValuesToEnum < ActiveRecord::Migration[8.0]
  def up
    Etiqueta.reset_column_information

    Etiqueta.find_each do |etiqueta|
      case etiqueta.tipo
      when "Autenticidade"
        etiqueta.update_column(:tipo_tmp, 0)
      when "Semelhança"
        etiqueta.update_column(:tipo_tmp, 1)
      else
        etiqueta.update_column(:tipo_tmp, 0) # valor default
      end
    end
  end

  def down
    Etiqueta.reset_column_information

    Etiqueta.find_each do |etiqueta|
      case etiqueta.tipo_tmp
      when 0
        etiqueta.update_column(:tipo, "Autenticidade")
      when 1
        etiqueta.update_column(:tipo, "Semelhança")
      end
    end
  end
end
