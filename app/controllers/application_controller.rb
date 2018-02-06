class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
   helper_method :current_user, :logged_in?, :current_room, :authenticate_admin!, :authenticate_user!
   #before_action :set_current_user
   before_action :configure_permitted_parameters, if: :devise_controller?
   #require Pundit



  def after_sign_out_path_for(user)
      root_path
  end

  def after_sign_in_path_for(admin)
      hgp_staff_dashboard_path
  end

protected

def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
 devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
 devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
end



private

  def set_current_user
    :current_user != nil
  end

  # def current_user
  #   current_user ||= User.find_by(id: session[:user])
  # end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

helper_method :current_user

  def logged_in?
    :current_user != nil
  end

  def authenticate_admin!

   unless current_user
      flash[:alert] = "Unauthorized Access: Genius, go back!"
      redirect_to root_path
    end
  end

  def access_denied(exception)
      redirect_to root_path, alert: exception.message
  end

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end


  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end

end
