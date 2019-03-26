class SessionsController < ApplicationController
    def new
        render :new
    end

    # logging the user in
    def create
        user = User.find_by_credentials(params[:user][:name], params[:user][:password])
        if user 
            #rails creates session cookie for us, session is a hash
            #generate new session token and set our session to that token
            login!(user)
            redirect_to chirps_url
        else
            # flash used for collecting errors 
            # flash - lasts for now and the next response cycle, usually for redirects
            # flash.now - only persist for this response, usually for render

            #we want errors to render once but not again on refresh
            flash[:errors] = ["Invalid username/password"]
            # render :new
            redirect_to new_session_url
        end
    end

    # log out, destroy current session
    def destroy
        logout!
        redirect_to new_session_url
    end
end