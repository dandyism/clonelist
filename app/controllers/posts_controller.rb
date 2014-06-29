class PostsController < ApplicationController
  before_filter :get_category
  before_filter :new_post, only: [:create]
  before_filter :authenticate_user!, only: [:manage]

  load_and_authorize_resource
  skip_authorize_resource only: [:manage, :confirm_delete]

  def get_category
    @category = Category.find(params[:category_id])
  end

  def new_post
    @post = current_user.posts.new(post_params)
    @post.category = @category
  end

  def index
    @posts = @category.try(:posts)
    @posts ||= Post.all
  end
  
  def new
    5.times { @post.images.build }
  end
  
  def create
    @post.images = image_params.map do |image_data|
      if image_data[:file].present?
        PostImage.new(image_data)
      end
    end.compact

    if @post.save
      redirect_to @post, notice: "Success"
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
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
      redirect_to @post
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
    render :index
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
