class UsersController < ApplicationController
  def show
    load_user
    decorate_user
  end

  protected

  def decorate_user
    @user = @user.decorate
  end

  def load_user
    @user ||= user_scope.find_by(username: params[:username])
  end

  def user_scope
    User
  end
end
