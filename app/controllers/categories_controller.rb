class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts

    unless params[:keywords].empty?
      keywords = params[:keywords].split
      conditions = []

      keywords.each do |keyword|
        conditions << "UPPER(title) LIKE UPPER('%#{keyword}%') OR UPPER(description) LIKE UPPER('%#{keyword}%')"
      end

      query = conditions.join(" OR ")
      @posts = @posts.where(query)
    end

    unless params[:min_price].empty?
      @posts = @posts.where('price >= ?', params[:min_price])
    end

    unless params[:max_price].empty?
      @posts = @posts.where('price <= ?', params[:max_price])
    end
  end
end
