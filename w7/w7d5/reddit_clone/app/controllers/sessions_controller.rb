class SessionsController < ApplicationController
  def new
    @user = current_user
    render :new
  end

  def create
    #??? params[user][username], params[user][password]
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    #login a user 
    if @user #if logged in correctly, go to a page (user's show)
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    #if not, render new
    end
  end
  
  def destroy
    
  end
end
