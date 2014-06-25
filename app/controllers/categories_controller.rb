class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])

    if params[:search]
      keywords = params[:search][:keywords].split
      query = ""

      keywords.each do |keyword|
        query += "UPPER(title) LIKE UPPER('%#{keyword}%') OR UPPER(description) LIKE UPPER('%#{keyword}%') "
      end

      @posts = @category.posts.where(query)
    end
  end
end
