class AuthenticationProvider < ActiveRecord::Base
  has_many :authentications
end
