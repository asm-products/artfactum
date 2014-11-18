class Artwork < ActiveRecord::Base
  mount_uploader :image, ArtworkUploader

  belongs_to :user
  belongs_to :gallery
  belongs_to :category, counter_cache: true
  belongs_to :sub_category, counter_cache: true

  has_many :attachments, dependent: :destroy
  has_many :taggings, inverse_of: :artwork
  has_many :tags, through: :taggings

  scope :recent, -> { 
    where(created_at: Range.new(Date.today.beginning_of_day, Date.today.end_of_day)) 
  }

  validates :title, presence: true

  paginates_per 12

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where('name ILIKE ?', n.strip).first_or_initialize.tap do |tag|
        tag.name = n.strip
        tag.save!
      end
    end
  end
end
