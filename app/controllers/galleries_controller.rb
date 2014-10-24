class GalleriesController < ApplicationController
	before_action :find_gallery, only: [:show, :destroy]
  
  def index
  	@galleries = Gallery.includes(:artworks).limit(1).page(params[:page])
  end

  def show
    @artworks = @gallery.artworks.page(params[:page])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.create(gallery_params)
    redirect_to gallery_path(@gallery)
  end

  def destroy
    if @gallery.destroy?
      redirect_to galleries_path
    end
  end

  private

  def find_gallery
  	@gallery = Gallery.find(params[:id])
  end

  def gallery_params
  	params.require(:gallery).permit(:name, :user_id)
  end
end