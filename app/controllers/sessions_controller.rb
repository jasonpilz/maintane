class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Login invalid"
      redirect_to login_path
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
    end
    redirect_to login_path
  end
end
