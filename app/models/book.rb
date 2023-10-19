class Book < ApplicationRecord
  validates :title, presence: true
  validates :authors, presence: true

  scope :ordered, -> { order(id: :desc) }
end
