class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])

    if params[:search]
      keywords = params[:search][:keywords]
      query = ""

      keywords.each do |keyword|
        query += "title LIKE '%#{keyword}% OR description LIKE '%#{keyword}%' "
      end

      @posts = @category.posts.where(query)
    end
  end
end
