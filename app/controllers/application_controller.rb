class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # assign current user id
  def current_user
    # this is an instance variable because it needs to exist for the
    # lifecycle of the controller, to prevent unnecessary hits on the db
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # authorize the user to perform certain actions
  def user_signed_in?
    current_user.present?
  end

  def user_is_admin?
    current_user.admin?
  end

  # for certain pages, redirect the user if they're not signed in
  def authenticate_user
    unless user_signed_in?
      redirect_to login_path, notice: "Please log in to continue."
    end
  end

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :user_is_admin?
  helper_method :authenticate_user

end
