class Obra < ApplicationRecord
validates :nome, presence: { message: "O nome do projeto não pode ficar em branco" }
  validates :endereco, presence: { message: "A localização é obrigatória para cadastrar a obra" }

    scope :active, -> { where(deleted_at: nil) }
    scope :by_user, ->(user) { where(created_by_id: user.id) }
    scope :ordered, -> { order(created_at: :desc) }

    has many :andares, -> {where(deleted_at: nil)} :dependent => :destroy
end

