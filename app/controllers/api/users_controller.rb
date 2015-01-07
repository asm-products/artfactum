module Api
  class UsersController < BaseController
    def show
      find_user
      render json: @user
    end

    def update
      find_user
      if @user.update_attributes(user_params)
        render json: @user, status: 200
      else
        invalid_resource(@user)
      end
    end

    def destroy
      find_user
      if @user.destroy
        render status: 204
      end
    end

    private

    def user_params
      permitted = params.require(:user).permit(*user_attributes)
      permitted
    end

    def find_user
      @user = User.find(params[:id])
      # Setup authorization here for certain actions
    end
  end
end
