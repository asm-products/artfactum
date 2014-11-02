class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :artworks

  validates :title, presence: true

  paginates_per 20
end
