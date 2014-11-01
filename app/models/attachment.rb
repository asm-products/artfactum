class Attachment < ActiveRecord::Base
  belongs_to :artworks
  belongs_to :user
end
