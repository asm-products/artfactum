class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :artworks
  has_many :galleries
  has_many :attachments, through: :artworks

  validates :username, uniqueness: { case_sensitive: false }
end
