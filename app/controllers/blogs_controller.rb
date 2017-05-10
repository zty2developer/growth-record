class BlogsController < ApplicationController
	def index
		@categories = Category.all
		@posts = Post.all.page(params[:page]).per(6)
	end

	def category
		category_id = params[:category_id]
		@posts = Post.all.page(params[:page]).per(6)
		@posts = Post.where(category_id: category_id).page(params[:page]).per(6) if category_id
	end
end
