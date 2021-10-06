class UsersController < ApplicationController

  def index
    # users = User.all
    # render json: users
    render plain: "I'm in the index action!"
  end

  def show
    # user = User.find(params[:id])
    # render json: user
    render json: params
  end

  def create
    # user = User.new(user_params)
    # if user.save
    #   redirect_to "/users/#{user.id}"
    # else
    #   render json: user.errors.full_messages, status: 422
    # end
    #render plain: "I'm in the create action!"
    render json: params

  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:fav_food)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end



end
