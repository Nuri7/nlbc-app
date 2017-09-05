class Bootcamp < ApplicationRecord
  belongs_to :passion
  has_many :feedbacks
  has_many :bootcamp_challenges
  has_many :challenges, through: :bootcamp_challenges
end
