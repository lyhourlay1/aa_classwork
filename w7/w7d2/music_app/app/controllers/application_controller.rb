class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token]) #why not set it by email 
    end

    def logged_in?
        !!current_user
    end

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
    end
    
    def loggout 
        current_user.reset_session_token! #why do we need a new session token when we log out
        session[:session_token]=nil
        @current_user = nil
    end
end
