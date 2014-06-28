class StaticPagesController < ApplicationController
  def search
    @posts = Post.search_by_keywords(params[:keywords])
  end
end
