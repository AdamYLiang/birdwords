class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        @user.location_id = Location.last.id
        if @user.save 
            login!(@user)
            redirect_to chirps_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :location_id, :birth_year)
    end
end