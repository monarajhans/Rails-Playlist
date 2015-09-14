class User < ActiveRecord::Base

  has_many :playlists
  has_many :adds, dependent: :destroy
  has_many :playlists_liked, through: :adds, source: :playlist

  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true
	validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX }

  before_save do
    self.email.downcase!
  end

end
