class GalleriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    decorate_galleries
  end

  def show
    load_gallery
    decorate_artworks
    decorate_gallery
  end

  def new
    build_gallery
    decorate_gallery
  end

  def edit
    load_gallery
    build_gallery
    decorate_gallery
  end

  def create
    build_gallery
    return if save_gallery
    render action: :new
  end

  def update
    load_gallery
    build_gallery
    return if save_gallery
    render action: :edit
  end

  def destroy
    load_gallery
    @gallery.destroy
    flash[:info] = t 'galleries.destroy.info'
    redirect_to galleries_path
  end

  protected

  def load_galleries
    @q ||= apply_scopes(Gallery).search(params[:q])
    @galleries ||= @q.result(distinct: true).page params[:page]
  end

  def decorate_galleries
    @galleries = (@galleries || load_galleries).decorate
  end

  def load_artworks
    @artworks ||= @gallery.artworks.page params[:page]
  end

  def decorate_artworks
    @artworks = (@artworks || load_artworks).decorate
  end

  def load_gallery
    @gallery ||= Gallery.find(params[:id])
  end

  def build_gallery
    @gallery ||= gallery_scope.build
    @gallery.attributes = gallery_params
  end

  def save_gallery
    if @gallery.save
      # i18n-tasks-use t('galleries.create.success')
      # i18n-tasks-use t('galleries.update.success')
      flash[:success] = t "galleries.#{params[:action]}.success"
      redirect_to gallery_path(@gallery)
    else
      # i18n-tasks-use t('galleries.create.error')
      # i18n-tasks-use t('galleries.update.error')
      flash.now[:error] = t "galleries.#{params[:action]}.error"
      decorate_gallery
    end
    @gallery.valid?
  end

  def decorate_gallery
    @gallery = @gallery.try(:decorate) || load_gallery.decorate
  end

  def gallery_scope
    current_user.galleries
  end

  def gallery_params
    Params.permit(params)
  end

  class Params
    def self.permit(params)
      return {} unless params[:gallery]
      params.require(:gallery)
            .permit(:title)
    end
  end
end
