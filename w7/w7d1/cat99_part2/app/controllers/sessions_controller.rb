class SessionsController < ApplicationController
  before_action :require_logged_in, only:[:destroy]
  before_action :require_logged_out, only:[:new, :create]
  
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username] , params[:user][:password])
      if @user
          login(@user)
          redirect_to cats_url 
      else
          render json: ["Invalid Username or Passord"]
      end
  end

  def destroy
    user = current_user
    user.reset_session_token!
    session[:session_token]=nil
    current_user = nil
    redirect_to new_session_url
  end
  
end
