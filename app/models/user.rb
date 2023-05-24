# The model that represents the User
class User < ApplicationRecord
  has_secure_password validations: true
  has_many :tokens
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :playlists
  has_many :ratings
  has_many :comments
  has_many :movies

  validates :email, :username, uniqueness: true
  validates :name, :email, :password, :username, presence: true

  # scope :invite_not_expired, -> { where('invitation_expiration > ?', DateTime.now) }
  # scope :invite_token_is, ->(invitation_token) { where(invitation_token: invitation_token) }

  # # Callbacks
  # before_create :generate_invitation_token
  # before_save :generate_invitation_token, if: :will_save_change_to_invitation_token?
  # after_commit :invite_user, if: :saved_change_to_invitation_token?

  def generate_token!(ip)
    token = Token.create(
      value: BaseApi::AccessToken.generate(self),
      user_id: id,
      expiry: DateTime.current + 7.days,
      ip: ip
    )
  end

  # def generate_invitation_token
  #   self.invitation_expiration = DateTime.current + 7.day
  #   loop do
  #     # Once we have a random, test whether it is unique in the DB
  #     self.invitation_token = SecureRandom.alphanumeric(15)
  #     break unless self.class.exists?(invitation_token: invitation_token)
  #   end
  # end

  # def invitation_accepted_at!
  #   update(invitation_accepted: true, invitation_token: nil, invitation_expiration: nil)
  # end

  # def invitation_link
  #   throw 'Environment Variable Not Found Error' if Rails.application.credentials.invitation[:url].nil?

  #   url = Rails.application.credentials.invitation[:url]
  #   "#{url}#{invitation_token}"
  # end

  # def invite_user
  #   # Email the user a link with the invitation_token
  #   InvitationWorker.perform_async(id)
  # end

  # def name
  #   "#{name}"
  # end
end
