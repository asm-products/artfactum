class UserDecorator < ApplicationDecorator
  def name
    "#{first_name} #{last_name}".strip
  end
end
