class ArtworksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  has_scope :recent, type: :boolean

  def index
    load_artworks
    decorate_artworks
  end

  def show
    load_artwork
    decorate_artwork
  end

  def new
    build_artwork
    decorate_artwork
  end

  def edit
    load_artwork
    build_artwork
    decorate_artwork
  end

  def create
    build_artwork
    return if save_artwork
    render action: :new
  end

  def update
    load_artwork
    build_artwork
    return if save_artwork
    render action: :edit
  end

  def destroy
    load_artwork
    @artwork.destroy
    flash[:info] = t 'artworks.destroy.info'
    redirect_to artworks_path
  end

  protected

  def load_artworks
    @q ||= apply_scopes(Artwork).search(params[:q])
    @artworks ||= @q.result(distinct: true).page params[:page]
  end

  def decorate_artworks
    @artworks = (@artworks || load_artworks).decorate
  end

  def load_artwork
    @artwork ||= Artwork.find(params[:id])
  end

  def build_artwork
    @artwork ||= artwork_scope.build
    @artwork.attributes = artwork_params
  end

  def save_artwork
    if @artwork.save
      # i18n-tasks-use t('artworks.create.success')
      # i18n-tasks-use t('artworks.update.success')
      flash[:success] = t "artworks.#{params[:action]}.success"
      redirect_to artwork_path(@artwork)
    else
      # i18n-tasks-use t('artworks.create.error')
      # i18n-tasks-use t('artworks.update.error')
      flash.now[:error] = t "artworks.#{params[:action]}.error"
      decorate_artwork
    end
    @artwork.valid?
  end

  def decorate_artwork
    @artwork = @artwork.try(:decorate) || load_artwork.decorate
  end

  def artwork_scope
    current_user.artworks
  end

  def artwork_params
    Params.permit(params)
  end

  class Params
    def self.permit(params)
      return {} unless params[:artwork]
      params.require(:artwork)
            .permit(:title, :description, :image, :gallery_id, :image_cache)
    end
  end
end
