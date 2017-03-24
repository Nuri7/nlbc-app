class UserPassion < ApplicationRecord
  belongs_to :passion
  belongs_to :user
end
