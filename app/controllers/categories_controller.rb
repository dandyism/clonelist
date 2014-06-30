class CategoriesController < ApplicationController
  respond_to :html, :json

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.page(params[:page])
  end
end
