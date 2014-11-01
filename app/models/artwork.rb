class Artwork < ActiveRecord::Base
  mount_uploader :image, ArtUploader

  belongs_to :user
  belongs_to :gallery

  has_many :attachments

  scope :recent, (lambda do
    where('created_at between ? and ?',
          Date.today.beginning_of_day,
          Date.today.end_of_day)
  end)

  validates :title, presence: true

  paginates_per 12
end
