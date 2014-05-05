class UsersController < ApplicationController


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save

			# to give the user a cookie when they sign up, so we know who they are
			session[:user_id] = @user.id

			flash[:success] = "Thanks for signing up!"
			redirect_to root_path

		else

			render "new" 

		end

	end

	def edit
		@user = User.find(params[:id])
		
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)

			flash[:success] = "Thanks for updating your details"

			redirect_to root_path

		else

			render "edit"

		end

	end
	

	def user_params
		params.require(:user).permit(:firstname, :surname, :username, :address, :email, :password, :password_confirmation)
	end

end
