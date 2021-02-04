class ApplicationController < ActionController::Base
  # Make the methods defined here avalilable to the views
  helper_method :current_user
  helper_method :logged_in?

  # Who is the current user?
  def current_user
    User.find_by(id: session[:user_id])
  end

  # Is there a user logged in?
  def logged_in?
    !current_user.nil?
  end
end
