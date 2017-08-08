class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_room
  before_action :configure_permitted_parameters, if: :devise_controller?



  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_admin_user
      flash[:alert] = "Unauthorized Access: Genius, go back!"
      redirect_to root_path
    end
  end

  def access_denied(exception)
      redirect_to root_path, alert: exception.message
  end

  private

  def sign_up_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def current_room
    @room ||= Chatoom.find(session[:current_room]) if session[:current_room]
  end

  def configure_permitted_parameters
     added_attrs = [:admin, :email, :password, :password_confirmation, :avatar, :remember_me]
     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end
end
