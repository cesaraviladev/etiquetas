class Parte < ApplicationRecord
  belongs_to :etiqueta

  validates :nome, :cpf, presence: true
end
