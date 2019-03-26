class Api::ChirpsController < ApplicationController

  def index
    # debugger
    @chirps = Chirp.all
    render json: @chirps
  end

  def create
    # debugger
    @chirp = Chirp.new(chirp_params) #ActiveRecord method
    @chirp.author = User.last
    if @chirp.save 
        render json: @chirp
    else
        # render json: @chirp.errors.full_messages, status: 422
        # flash.now[:errors] = @chirp.errors.full_messages
        # render :new, status: 422
        # debugger
    end
  end

  def show
    @chirp = Chirp.find(params[:id])
    render json: @chirp
  end
  
  private
  def chirp_params
      params.require(:chirp).permit(:body)
  end

end