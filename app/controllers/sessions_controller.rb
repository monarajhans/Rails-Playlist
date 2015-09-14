class SessionsController < ApplicationController

	def index
		
	end

	def create
	    user = User.find_by(email: params[:email])
	    if user && user.authenticate(params[:password])
	      session[:user_id] = user.id
	      redirect_to "/users/#{user.id}"
	    else
	      flash[:errors] = ["Invalid email or password"]
	      redirect_to "/sessions"
	    end
	end

	def destroy
		session[:user_id] = nil
		redirect_to "/sessions"
	end
end