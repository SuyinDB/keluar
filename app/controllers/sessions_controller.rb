class SessionsController < ApplicationController

def new
		# signup form
		# no need for any variables because we're not adding anything to the database	
	end

	def create
		# instructions
		# let's get the username and password from the new form
		# let's see if there's a user with that username
		# if there is AND the password matches, then login
		# if not then don't log in and show an error...

		# first we define the username as the username field from the form we called :session on the new page
		@username = params[:session][:username]

		# ditto with the password
		@password = params[:session][:password]

		# find the user with the username defined in the form
		@user = User.find_by_username(@username) 

		# if a user exists with that username AND the password matches with the password entered 
		if @user.present? and @user.authenticate(@password)

			# if it's true then give them their session 
			session[:user_id] = @user.id

			flash[:success] = "Welcome back #{@user.username}, you're signed in"
			redirect_to root_path

			else
			
			flash[:error] = "Sign in failed"
			render "new"	

		end

	end

	def destroy
		# log out, reset_session is built in to Rails by ActionController
		reset_session
		flash[:success] = "You are now logged out"
		redirect_to root_path
	end

end

