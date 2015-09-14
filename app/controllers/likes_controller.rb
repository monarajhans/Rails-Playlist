class LikesController < ApplicationController

	def show
		@user = User.find(params[:id])
		@playlist = User.find(params[:id]).playlists_liked
	end

end