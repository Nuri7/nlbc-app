class Bootcamp < ApplicationRecord
  has_many :bootcamp_passions
  has_many :passions, through: :bootcamp_passions
  has_many :feedbacks
end
