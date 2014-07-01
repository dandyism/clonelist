class PostsController < ApplicationController
  respond_to :html, :json

  before_filter :new_post, only: [:create]
  before_filter :authenticate_user!, only: [:manage]

  load_and_authorize_resource
  skip_authorize_resource only: [:manage, :confirm_delete]

  def new_post
    @post = current_user.posts.new(post_params)
  end

  def new
    5.times { @post.images.build }
  end

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts.page(params[:page])

    if params[:keywords].present?
      @posts = @posts.search_by_keywords(params[:keywords])
    end
  end

  def create
    @post.images = image_params.map do |image_data|
      if image_data[:file].present?
        PostImage.new(image_data)
      end
    end.compact

    if @post.save
      redirect_to @post, notice: I18n.t('post.create.success')
    else
      flash.now[:errors] = @post.errors.full_messages
      5.times { @post.images.build }
      render :new
    end
  end

  def show
    @js_abilities = ability_to_array(current_ability)
  end

  def edit
    until @post.images.length >= 5
      @post.images.build
    end
  end

  def update
    @post.images = image_params.map do |image_data|
      if image_data[:id].present?
        image = PostImage.find(image_data[:id])

        if image_data[:_destroy]
          image.destroy
          next
        end

        image.update(image_data)
        image
      elsif image_data[:file].present?
        PostImage.new(image_data)
      end
    end.compact

    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('post.update.success')
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    @post.destroy!
    redirect_to :root
  end

  def manage
    @posts = current_user.posts
  end

  def confirm_delete
    authorize! :destroy, @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :price, :category_id,
                                :address_1, :address_2, :city, :region, :postalcode)
  end

  def image_params
    params.permit(images: [:file, :id, :_destroy]).require(:images).values
  end
end
