class Parte < ApplicationRecord
  belongs_to :etiqueta
  belongs_to :tenant
  acts_as_tenant(:tenant)
  validates :nome, :cpf, presence: true
end
