class Obra < ApplicationRecord
    validates :nome, presence: true
    validates :endereco, presence: true

    scope :active, -> { where(deleted_at: nil) }
    scope :by_user, ->(user) { where(created_by_id: user.id) }
    scope :ordered, -> { order(created_at: :desc) }
end

