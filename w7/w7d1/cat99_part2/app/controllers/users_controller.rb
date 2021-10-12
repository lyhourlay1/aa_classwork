class UsersController < ApplicationController
  before_action :require_logged_out, only:[:new, :create]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save!
      login(@user)
      redirect_to cats_url
    else
      render json: ["Invalid password"]
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
