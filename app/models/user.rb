class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :authentications, dependent: :destroy
  has_many :artworks
  has_many :galleries
  has_many :attachments, through: :artworks

  validates :username, uniqueness: { case_sensitive: false }
end
