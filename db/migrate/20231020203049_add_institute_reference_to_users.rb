class AddInstituteReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :institute, null: false, foreign_key: true
  end
end
