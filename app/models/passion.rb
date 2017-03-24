class Passion < ApplicationRecord
  has_many :bootcamp_passions
  has_many :bootcamps, through: :bootcamp_passions

  has_many :user_passions
  has_many :users, through: :user_passions
end
