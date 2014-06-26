class PostsController < ApplicationController
  before_filter :new_post, only: [:create]

  load_and_authorize_resource

  def new_post
    @post = current_user.posts.new(post_params)
    @post.images = image_params.map do |image_data|
      if image_data[:id].present?
        image = PostImage.find(image_data[:id])

        if image_data[:file].blank?
          image.destroy
          next
        end

        image.update(image_data)
        image
      elsif image_data[:file].present?
        PostImage.new(image_data)
      end
    end.compact
  end

  def index
    @posts = Post.all
  end
  
  def new
    5.times { @post.images.build }
  end
  
  def create
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
  end
  
  def update
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
  
  private
  def post_params
    params.require(:post).permit(:title, :description, :price, :location, :category_id)
  end

  def image_params
    params.permit(images: [:file, :id]).require(:images).values
  end
end
