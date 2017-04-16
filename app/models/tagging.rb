class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :artwork

  validates :tag, :artwork, presence: true
end
