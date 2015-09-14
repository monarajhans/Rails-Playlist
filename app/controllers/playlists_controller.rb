class PlaylistsController < ApplicationController

	def create
		playlist = Playlist.new(playlist_params)
		playlist.user = User.find(session[:user_id])
		playlist.count = 0

		if playlist.save
			redirect_to "/users/#{session[:user_id]}"
		else
			flash[:errors] = playlist.errors.full_messages
			redirect_to "/users/#{session[:user_id]}"
		end
	end

	def show
		@song = Playlist.find(params[:id])
		@playlist = Playlist.find(params[:id]).users_liked
	end

	def update
		playlist = Playlist.find(params[:id])
		number = playlist.count + 1
		playlist.update(count: number)
		Add.create(user: User.find(session[:user_id]), playlist: Playlist.find(params[:id]))
		redirect_to "/users/#{session[:user_id]}"
	end

	private

	def playlist_params
		params.require(:playlist).permit(:song, :artist)
	end
end