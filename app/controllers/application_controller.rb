class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
   helper_method :current_user, :logged_in?, :current_room, :authenticate_admin_user!, :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?
   rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

protected

    def not_found_error
      render file: 'public/401.html', status: :not_found
    end

  #  rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = exception.message
  #   redirect_to root_url
  # end


    def after_sign_out_path_for(user)
        root_path
    end

    def after_sign_in_path_for(admin)
        admin_dashboard_path
    end

    def after_sign_in_path_for(user)
        root_path
    end

    def after_sign_out_path_for(admin)
        root_path
    end



protected

  def configure_permitted_parameters
       attributes = [:first_name, :last_name, :username, :email, :avatar, :cohort, :cohort_id, :city, :password, roles: []]
       devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
       devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
       devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end


private

  def set_current_user
    :current_user != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

helper_method :current_user

  def logged_in?
    :current_user != nil
  end

  def authenticate_admin_user!

   unless :current_admin_user
      flash[:alert] = "Unauthorized Access: Genius, go back!"
      redirect_to  admin_signup_path
    end
  end

  def access_denied(exception)
      redirect_to root_path, alert: exception.message
  end

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end
helper_method :current_room

  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end


end
