class Bootcamp < ApplicationRecord
  belongs_to :passion
  has_many :feedbacks
end
