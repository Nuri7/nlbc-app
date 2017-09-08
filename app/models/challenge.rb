class Challenge < ApplicationRecord
  belongs_to :passion
  has_many :teachers
  has_many :bootcamp_challenges
  has_many :bootcamps, through: :bootcamp_challenges
end
