class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    load_category
    load_sub_categories
    load_sub_category
    filter_categories
    load_artworks
  end

  protected

  def load_category
    @category = Category.find(params[:category_id])
  end

  def load_sub_categories
    @sub_categories = @category.sub_categories if @category
  end

  def load_sub_category
    @sub_category = @category.sub_categories.where('slug = ?', params[:sub_category_id]).first if @category
  end

  def filter_categories
    @artworks_filter = {}
    @artworks_filter[:category_id] = @category.id if @category
    @artworks_filter[:sub_category_id] = @sub_category.id if @sub_category
  end

  def load_artworks
    @artworks = @category.artworks.where(@artworks_filter).page(params[:page]) if @category
  end
end