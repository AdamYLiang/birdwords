class Api::UsersController < ApplicationController 

  def index
    # debugger
    @users = User.all.includes(:chirps)
    # render json: @users, status: 200
    render :index
  end

  def show 
    @user = User.find(params[:id])
    # render json: @user, status: 200
    render :show
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :password, :location_id, :birth_year)
  end
end 