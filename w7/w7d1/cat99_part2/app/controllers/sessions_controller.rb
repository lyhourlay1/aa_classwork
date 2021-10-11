class SessionsController < ApplicationController
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
    redirect_to new_sess
  end
  
end
