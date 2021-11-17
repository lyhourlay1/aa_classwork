class Api::UsersController < ApplicationController
    def index
        @user = User.all
        
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
          login!(@user)
          render :show # this isn't json right?
        else
          render json: @user.errors.full_messages, status: 401
        end
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
