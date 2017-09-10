class Passion < ApplicationRecord
  belongs_to :category
  has_many :challenges
  has_many :bootcamps

  has_many :user_passions
  has_many :users, through: :user_passions
  has_attached_file :image, styles: { medium: "300x300>", thumb: "120x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
end
