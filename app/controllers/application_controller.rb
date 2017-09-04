class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :current_room, :authenticate_admin!, :authenticate_user!
   #before_action :set_current_user
   before_action if: :devise_controller?
   #before_action :configure_permitted_parameters
   #require Pundit

  def after_sign_out_path_for(user)
      root_path
  end

  def after_sign_in_path_for(admin)
      admin_dashboard_path
  end

private
  def set_current_user
    :current_user != nil
  end

  def current_user
    current_user ||= User.find_by(id: session[:user])
  end

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


  # def sign_up_params
  #   params.require(:user).permit(:first_name, :last_name, :city, :cohort_id, :email, :password, :password_confirmation)
  # end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end

  # def configure_permitted_parameters
  #    added_attrs = [:admin, :username, :stipend, :benchmark, :avatar, :remember_me]
  #    #devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #    #devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end

  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end

end
