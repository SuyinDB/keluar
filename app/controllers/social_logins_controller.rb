class SocialLoginsController < ApplicationController

     # we want to handle log in or sign up with social networks

     def create

          # get data from the omniauth that returns back
          @data = request.env["omniauth.auth"]

          # this is data from omniauth
          @provider = @data["provider"]
          @provider_id = @data["uid"]

          # are there any users on the site that already have this provider and provider_id?
          @users = User.where(provider: @provider, provider_id: @provider_id)

          if @users.any?

               # get the first user in the list
               @user = @users.first
               # sign in as that user
               session[:user_id] = @user.id
               flash[:success] = "You are now signed in with #{@provider}."
               redirect_to root_path

          else
               # otherwise make a user with the details from omniauth
               @user = User.new
               
                # fill in the provider details
                @user.provider = @provider
                @user.provider_id = @provider_id

                # let's get the users info from omniauth
                @user.firstname = @data["info"]["first_name"]
                @user.surname = @data["info"]["last_name"]
                @user.username = @data["info"]["nickname"]
                @user.email = @data["info"]["email"]

                # let's fill in the users password
                @user.password = "qwerty123098"
                @user.password_confirmation = "qwerty123098"

                # let's save the details for the provider's API
                @user.key = @data["credentials"]["token"]
                @user.secret = @data["credentials"]["secret"]

                #save the details above
                @user.save!  
               #@user.save! with ! means it errors properly rather than quietly.

                # sign them in
                session[:user_id] = @user.id    
                flash[:success] = "You are now signed in with #{@provider}."
                redirect_to root_path

          end

     end

end