class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :current_room, :authenticate_admin!, :authenticate_user!
   #before_action :set_current_user
   #before_action :configure_permitted_parameters, if: :devise_controller?
   #require Pundit

  def after_sign_out_path_for(user)
      root_path
  end

  def after_sign_in_path_for(admin)
      hgp_staff_dashboard_path
  end

protected

    def configure_permitted_parameters
        devise_parameter_sanitizer(:sign_up) { |u| u.permit( :email, :password, :avatar) }
        devise_parameter_sanitizer(:account_update) { |u| u.permit( :email, :password, :current_password, :avatar) }
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


#   def sign_up_params
#     params.require(:user).permit(:first_name, :last_name, :city, :cohort_id, :email, :avatar, :project
# )
#   end
#
#   def account_update_params
#     params.require(:user).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
#   end

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end


  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end

end
