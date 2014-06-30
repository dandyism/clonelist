class StaticPagesController < ApplicationController
  def index
  end

  def manage
    @posts = current_user.posts.page(params[:page])
  end

  def search
    @posts = Post.search_by_keywords(params[:keywords])

    if params[:min_price].present?
      @posts = @posts.where('price >= ?', params[:min_price])
    end

    if params[:max_price].present?
      @posts = @posts.where('price <= ?', params[:max_price])
    end

    @posts = @posts.page(params[:page])
  end
end
