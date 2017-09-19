class User < ApplicationRecord
  before_save :correct_role_format
  before_update :correct_role_format
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "120x120>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 5.megabytes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_teams
  has_many :teams, through: :user_teams

  has_many :user_passions
  has_many :passions, through: :user_passions
  has_many :teachers

  has_many :user_challenges
  has_many :challenges, through: :user_challenges


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name   # assuming the user model has a name
      if auth.info.gender.present?
        if auth.info.gender == 'male'
          user.male = true
        elsif auth.info.gender == 'female'
          user.male = false
        end
      end
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def correct_role_format
    self.role.downcase! if self.role
  end

  def self.search_by_city(params)
    where(city: params['locations'])
  end

end
