class VotesController < ApplicationController

	def create
		Vote.create! params[:vote]
		redirect_to root_path
	end

end
