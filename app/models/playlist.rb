class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :adds, dependent: :destroy
  has_many :users_liked, through: :adds, source: :user

  validates :song, :artist, presence: true, length: { in: 2..20 }
end
