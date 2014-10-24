class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :artworks

  paginates_per 20
end
