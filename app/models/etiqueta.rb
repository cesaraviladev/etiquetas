class Etiqueta < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  acts_as_tenant(:tenant)
  has_many :partes, dependent: :destroy
  accepts_nested_attributes_for :partes, allow_destroy: true

  validates :data_emissao, :tipo, :quantidade, presence: true

end
