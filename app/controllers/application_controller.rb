class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render 'shared/not_found', status: 404
  end
end
