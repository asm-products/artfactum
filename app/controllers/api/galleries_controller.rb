module Api
  class GalleriesController < BaseController
    skip_before_filter :authenticate_user_from_token!, only: [:index, :show]

    def index
      @galleries = Gallery.all
      render json: @galleries
    end

    def show
      find_gallery
      render json: @gallery
    end

    def update
      find_gallery
      if @gallery.update_attributes(gallery_params)
        render json: @gallery, status: 200
      else
        invalid_resource(@gallery)
      end
    end

    def destroy
      find_gallery
      if @gallery.destroy
        render status: 204
      end
    end

    private

    def gallery_params
      permitted = params.require(:gallery).permit(*gallery_attributes)
      permitted
    end

    def find_gallery
      @gallery = Gallery.find(params[:id])
      # Setup authorization here for certain actions
    end
  end
end
