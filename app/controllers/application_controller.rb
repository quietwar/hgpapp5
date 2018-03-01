class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  #skip_before_action :verify_authenticity_token
   helper_method :current_user, :current_admin, :logged_in?, :current_room, :authenticate_admin_user!, :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?
   rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

protected

    def not_found_error
      render file: 'public/401.html', status: :not_found
    end

   rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end


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


  def configure_permitted_parameters
       attributes = [:first_name, :last_name, :username, :email, :avatar, :cohort, :cohort_id, :city, :password, roles: []]
       devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
       devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
       devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end


private

 # def authenticate
 #  	redirect_to :login unless user_signed_in?
 #  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
  	# converts current_user to a boolean by negating the negation
  	!!current_user
  end

  def set_current_user
    current_user != nil
  end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end


  def logged_in?
    current_user != nil
  end

  # def authenticate_admin_user!
  #    authenticate_user!
  #    # current_user is devise provided method.
  #    # Authority You can do whatever you like about the user's role.  (In my case, implemented with the has_role method)
  #    unless current_user.has_role 'admin'
  #      flash[:alert] = "Unauthorized Access: Genius, go back! Otherwise, please login as staff."
  #      redirect_to admin_signup_path
  #    end
  #  end

  def authenticate_admin_user!

   unless :current_admin
      flash[:alert] = "Unauthorized Access: Genius, go back!"
      redirect_to  admin_signup_path
    end
  end

  def access_denied(exception)
    redirect_to admin_login_path, alert: exception.message
  end

  def current_room
    @room ||= Room.find(session[:current_room]) if session[:current_room]
  end
helper_method :current_room

  def current_class
    @class ||= Class.find(session[:current_class]) if session[:current_class]
  end


end
