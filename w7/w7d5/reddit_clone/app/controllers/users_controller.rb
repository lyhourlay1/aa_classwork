class UsersController < ApplicationController
  before_action :require_sign_in, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_url(@user) #need to direct to sub#index page
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show #need to delete this later
    @user = User.find_by(id: params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
