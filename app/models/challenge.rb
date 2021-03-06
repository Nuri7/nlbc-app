class Challenge < ApplicationRecord
  belongs_to :passion
  has_many :teachers
  has_many :bootcamp_challenges
  has_many :bootcamps, through: :bootcamp_challenges
  has_many :user_challenges
  has_many :users, through: :user_challenges
  validates :price, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "120x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
  has_attached_file :document
end
