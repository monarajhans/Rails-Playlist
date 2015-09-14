class UsersController < ApplicationController

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/users/#{user.id}"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/sessions"
		end
	end

	def show
		@user = User.find(params[:id])
		@playlists = Playlist.all
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end