class SessionsController < ApplicationController
  #skip_before_action :authenticated, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path(user.id), notice: "Logged in!"
    else
      flash.now[:alert] = "Username or password is invalid"
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
