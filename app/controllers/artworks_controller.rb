class ArtworksController < ApplicationController
  before_action :find_artwork, only: [:show, :edit, :update, :destroy]

  def index
    @artworks = Artwork.page(params[:page])

    if params[:sort]
      @sort = params[:sort]
    else
      @sort == "recent"
    end

    if @sort == "recent"
      @artworks = Artwork.recent.page(params[:page])
    end
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = current_user.artworks.create(artwork_params)

    if @artwork.save
      redirect_to artwork_path(@artwork)
    end
  end

  def edit
    redirect_to artwork_path(@artwork) unless current_user.id == @artwork.user_id
  end

  def update
    if current_user.id == @artwork.user_id
      @artwork.update(artwork_params)
      redirect_to artwork_path(@artwork)
    else
      redirect_to artworks_path
    end
  end

  def destroy
    if @artwork.destroy
      redirect_to artworks_path
    end
  end

  private

  def find_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :image, :user_id, :gallery_id)
  end
end