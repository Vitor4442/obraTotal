class Andar < ApplicationRecord
  belongs_to :obra

  # Escopo para pegar apenas os não deletados
  scope :active, -> { where(deleted_at: nil) }
  scope :ordered, -> { order(:numero) } # Ordenar por número do andar

  validates :numero, presence: true

end
