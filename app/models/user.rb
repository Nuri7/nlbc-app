class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  before_validation :set_default_role
  has_many :user_teams
  has_many :teams, through: :user_teams


  private

  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end