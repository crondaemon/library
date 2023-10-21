class User < ApplicationRecord
  devise :database_authenticatable, :validatable
  belongs_to :institute

  def name
    email.split("@").first.capitalize
  end
end
