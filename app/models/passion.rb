class Passion < ApplicationRecord
  belongs_to :category
  has_many :challenges
  has_many :bootcamps

  has_many :user_passions
  has_many :users, through: :user_passions
end
