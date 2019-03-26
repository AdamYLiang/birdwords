class ChirpsController < ApplicationController
    #before we do any of the following actions, do these methods
    before_action :ensure_logged_in, except: [:index]


    #snake case, pluralized for controller file name

    #rails is able to require all the models for us
    #as long as we are strict with our naming conventions
    def index
        # This variable must be an instance variable for views to have access
        @chirps = Chirp.all.includes(:author)  # eager load the authors association
        # render json: @chirps #sending this back as response
        # no more json
        # tester is the name of the template we want to render.
        # Rails will look for a view file called 'tester' in a /chirps directory inside of the /views directory 
        # render :tester
        render :index # maintaining RESTful convention
    end

    # One single chirp
    def show
        @chirp = Chirp.find_by(id: params[:id])
        # we use find, instead of find_by, because it will
        # throw an error if it's not in the database
            #find_by only returns nil if it can't find it

        # render json: @chirp, status: 200
        #status 200 tells browser req/res is successful
        if @chirp # it's truthy if we found a chirp
            render :show
        else 
            # redirect is specifically for redirecting to URLs (don't pull a Brian)
            # This won't work: redirect_to :index
            # Redirect is always a GET request
            redirect_to chirps_url
        end
    end 

    def new 
        @chirp = Chirp.new
        # @chirp.persisted? #=> false
        # The only thing this action does is give the client a form
        render :new
    end

    def create
        # @chirp = Chirp.new(chirp_params)
        # @chirp.author_id = current_user.id

        # we can take advantage our associations and it will take care of our IDs
        @chirp = current_user.chirps.new(chirp_params) #ActiveRecord method

        #save returns true/false, save! throws error
        if @chirp.save 
            # render json: @chirp, status: 200 #defaults to 200 if everything is OK
            # debugger
            redirect_to chirp_url(@chirp)
            # The above is the same as saying redirect_to chirp_url(@chirp.id)
            # redirect_to "http://www.wikipedia.org"
        else
            # render json: @chirp.errors.full_messages, status: 422
            flash.now[:errors] = @chirp.errors.full_messages
            render :new, status: 422
        end
    end

    def edit
        @chirp = current_user.chirps.find_by(id: params[:id])
        # @chirp.persisted? #=> true
        if @chirp 
            render :edit
        else 
            redirect_to chirps_url
        end
    end

    def update
        # @chirp = Chirp.find(params[:id])
        @chirp = current_user.chirps.find(params[:id])
        if @chirp.update(chirp_params)
            # render json: @chirp, status: 200
            redirect_to chirp_url(@chirp)
        else
            render json: @chirp.errors.full_messages, status: 422
        end
    end

    def destroy
        # @chirp = Chirp.find(params[:id])
        @chirp = current_user.chirps.find(params[:id])
        @chirp.delete 
        redirect_to chirps_url
    end

    def set_cookie
        maybe_cookie = params[:my_cookie]

        if maybe_cookie
        cookies[:my_cookie] = maybe_cookie
        render plain: "I am setting your cookie: #{cookies[:my_cookie]}"
        else
        render plain: "You must provide a cookie"
        end
    end

    def get_cookie
        # we have access to the hash cookies, flash, and session by default
        my_cookie = cookies[:my_cookie]
        if my_cookie
        render plain: "Here's your cookie: #{my_cookie}"
        else
        render plain: "You haven't set a cookie called :my_cookie yet"
        end
    end

    private
    def chirp_params
        params.require(:chirp).permit(:body)
    end
end