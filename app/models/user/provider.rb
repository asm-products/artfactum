class User
  class Provider < ActiveRecord::Base
    has_many :authentications
  end
end
