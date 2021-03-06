class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  helper_method :current_user

  def login(user)
    session[:session_token] = user.reset_session_token!
    render :show
  end

  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
    render :text => "bye"
  end

  def current_user
    @current_user = User.find_by({session_token: session[:session_token]})
  end

  def ensure_not_logged_in
    redirect_to root_path if session[:session_token]
  end

  protected

  def json_request?
    request.format.json?
  end

end
