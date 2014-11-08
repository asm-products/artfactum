class Artwork
  class Attachment < ActiveRecord::Base
    belongs_to :artwork
  end
end
