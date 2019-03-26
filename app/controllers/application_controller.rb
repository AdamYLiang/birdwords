class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method allows us to use the following methods with our views
  helper_method :current_user, :logged_in?

  #the user that is currently logged in
  def current_user
    #will give us the user logged in or it will give us nil
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    #we don't want this to ever be nil or truthy object
    #this will make it so it will always be either true or false
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end 

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def ensure_logged_in 
    redirect_to new_session_url unless logged_in?
  end
end

#Know these methods and how they work! Don't just memorize them. 

#C - current user
#E - ensure_logged_in
#L - login
#L - logout
#L - logged_in?