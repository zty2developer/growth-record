class BlogsController < ApplicationController
	def index
		category_id = params[:category_id]
		@categories = Category.all
		@posts = Post.all.page(params[:page])
		@posts = Post.where(category_id: category_id).page(params[:page]) if category_id
	end
end
