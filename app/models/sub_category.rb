class SubCategory < ActiveRecord::Base
  has_many :artworks
  belongs_to :category, dependent: :destroy

  validates :category_id, :name, :slug, presence: true
end
