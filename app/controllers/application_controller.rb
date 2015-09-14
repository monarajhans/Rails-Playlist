class ApplicationController < ActionController::Base
	
	def current_user
	    User.find(session[:user_id]) if session[:user_id]
	end

  	helper_method :current_user
 	protect_from_forgery with: :exception

end
