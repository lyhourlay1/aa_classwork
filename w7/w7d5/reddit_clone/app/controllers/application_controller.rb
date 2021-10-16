class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  #sign in , sign out, signed in ?, current user, require_sign_in

  #when calling on the current user, just use current_user method (not @current_user)
  #user @current_user only to assign values to it. 

  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def sign_in(user)
    # make sure current user is user, reset user's session token, set cookie's session token
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def sign_out
    current_user.reset_session_token! #it's okay to use @current_user
    @current_user = nil
    session[:session_token] = nil
  end

  def signed_in? #MUST USE CURRENT_USER METHOD
    !!current_user
  end

  def require_sign_in
    redirect_to new_session_url unless signed_in?
  end

end
