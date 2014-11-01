class User < ActiveRecord::Base
  devise :omniauthable, :trackable
  has_many :authentications, dependent: :destroy
  has_many :apps

  def self.create_from_omniauth(params)
    attributes = {
      email: params[:info][:email] || '',
      first_name: params[:info][:first_name] || params[:info][:name],
      last_name: params[:info][:last_name],
      avatar_url: params[:info][:image]
    }
    create attributes
  rescue NoMethodError
    false
  end
end
