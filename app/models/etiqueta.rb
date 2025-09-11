class Etiqueta < ApplicationRecord
  has_many :partes, dependent: :destroy
  accepts_nested_attributes_for :partes, allow_destroy: true

  extend EnumerateIt
  has_enumeration_for :tipo, with: TipoEtiqueta, create_helpers: true

  validates :data_emissao, :tipo, :quantidade, presence: true
end
