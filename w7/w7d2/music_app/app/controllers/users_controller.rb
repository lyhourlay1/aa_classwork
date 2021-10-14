class UsersController < ApplicationController
    def show 
        @user = User.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!
            redirect_to user_url(@user) 
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
end
