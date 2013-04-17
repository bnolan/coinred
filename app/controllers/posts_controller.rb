class PostsController < ApplicationController

	def index
		@posts = Post.order('created_at desc').all
	end

	def create
		@post = current_user.posts.build params[:post]

		if @post.save
			redirect_to :action => :index
		else
			render :action => 'new'
		end
	end

end
