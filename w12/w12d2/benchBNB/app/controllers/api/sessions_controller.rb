class Api::SessionsController < ApplicationController
    def create
        # Find user by credentials
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil?
            render json: ['Nope. Wrong credentials!'], status: 401
        else
            login!(@user)
            render 'api/users/show';
        end
    end

    def destroy
        if !logged_in?
            render json: ['Error, youre not logged in.'], status: 404
        else
            logout!
            render json: { message: "Logged-out!"}
        end
    end
end
