class Passion < ApplicationRecord
  has_many :bootcamp_passions
  has_many :bootcamps, through: :bootcamp_passions
end
