class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :artworks, through: :taggings

  scope :popular, (lambda do
    joins(:artworks).order('artworks.count DESC').group('tags.id')
  end)

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.list
    Tag.order(:name).map { |t| { tag: t.name } }
  end
end
