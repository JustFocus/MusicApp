class SessionsController < ApplicationController

	def new
		destroy if session[:session_token]
		render :new
	end

	def create
		user = User.find_by(email: params[:user][:email])

		if user.nil? || !user.is_password?(params[:user][:password])
			flash[:errors] = "Bad Username/password combination"
			redirect_to new_session_url
		else
			log_in_user!(user)
			redirect_to user_url(user.id)
		end
	end

	def destroy
		session[:session_token] = nil
	end

end
