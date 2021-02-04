class SessionsController < ApplicationController
  # GET /welcome
  def welcome; end

  # GET /login
  def new
    render :login
  end

  # POST /login
  def create
    user = User.find_by(name: params[:name])

    if user
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to new_user_url, notice: 'User not found! Sign up, first.'
    end
  end

  # POST /logout
  def destroy
    reset_session
    redirect_to welcome_url
  end
end
