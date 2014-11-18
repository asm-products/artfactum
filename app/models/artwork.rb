class Artwork < ActiveRecord::Base
  mount_uploader :image, ArtworkUploader

  belongs_to :user
  belongs_to :gallery
  belongs_to :category, counter_cache: true
  belongs_to :sub_category, counter_cache: true

  has_many :attachments, dependent: :destroy

  scope :recent, -> { 
    where(created_at: Range.new(Date.today.beginning_of_day, Date.today.end_of_day)) 
  }

  validates :title, presence: true

  paginates_per 12
end
