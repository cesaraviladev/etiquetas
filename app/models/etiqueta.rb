class Etiqueta < ApplicationRecord
  has_many :partes, dependent: :destroy
  accepts_nested_attributes_for :partes, allow_destroy: true

  enum :tipo, { autenticidade: 0, semelhanca: 1 }, prefix: true

  validates :data_emissao, :tipo, :quantidade, presence: true
end
