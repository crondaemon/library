class AddInstituteReferenceToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :institute, null: false, foreign_key: true
  end
end
