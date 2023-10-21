class Institute < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :books, dependent: :destroy

  validates :name, presence: true
end
