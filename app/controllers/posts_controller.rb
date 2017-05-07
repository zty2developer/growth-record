class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :about, :contact]

  def index
		@posts = Post.all.page(params[:page])
  end

	def about
	end

	def contact
	end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save(post_params)
      flash[:notice] = "Successfully created post!"
      redirect_to posts_path
    else
      flash[:notice] = "Error creating new post!"
      render :new
    end
  end

  def edit
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:notice] = "Error deleted post"
    end
  end

  def show
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to posts_path
    else
      flash[:notice] = "Error updated post!"
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
