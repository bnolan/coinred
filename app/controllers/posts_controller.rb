class PostsController < ApplicationController

	def index
		@posts = Post.order('created_at desc').all
	end

	def create
		post = Post.create! params[:post]
		redirect_to :action => :index
	end

end
