class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])

    if params[:keywords]
      keywords = params[:keywords].split
      conditions = []

      keywords.each do |keyword|
        conditions << "UPPER(title) LIKE UPPER('%#{keyword}%') OR UPPER(description) LIKE UPPER('%#{keyword}%')"
      end

      query = conditions.join(" OR ")
      @posts = @category.posts.where(query)
    end
  end
end
