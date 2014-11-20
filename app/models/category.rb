class Category < ActiveRecord::Base
  has_many :artworks
  has_many :sub_categories

  validates :name, :slug, presence: true
end
