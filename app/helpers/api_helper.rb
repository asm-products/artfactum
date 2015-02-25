module ApiHelper
  def user_attributes
    [:id, :first_name, :last_name, :email, :avatar_url, :authentication_token, :created_at, :updated_at]
  end
  def gallery_attributes
    [:id, :user_id, :title]
  end
end
