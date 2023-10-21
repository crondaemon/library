class Book < ApplicationRecord
  belongs_to :institute

  validates :title, presence: true
  validates :authors, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "books" }
  # after_update_commit -> { broadcast_replace_later_to "books" }
  # after_destroy_commit -> { broadcast_remove_to "books" }
  broadcasts_to ->(book) { [book.institute, "books"] }, inserts_by: :prepend
end
