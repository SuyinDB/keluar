class ApplicationController < ActionController::Base
  

  def current_user
	  if session[:user_id].present?
       User.find(session[:user_id])
    end
  end

  # to make the current user method above useful in the views
  helper_method :current_user

  
  def make_sure_logged_in
      if not current_user.present?
        flash[:error] = "You must be signed up to see this page"
        redirect_to new_user_path
      end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
