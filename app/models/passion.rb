class Passion < ApplicationRecord
  has_many :bootcamps

  has_many :user_passions
  has_many :users, through: :user_passions
end
