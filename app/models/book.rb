class Book < ApplicationRecord
  validates :title, presence: true
  validates :authors, presence: true
end
