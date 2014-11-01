class User
  class Provider < ActiveRecord::Base
    has_many :authentications, dependent: :destroy
  end
end
