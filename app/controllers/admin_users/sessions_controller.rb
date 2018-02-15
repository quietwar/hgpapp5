class AdminUsers::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  include Accessible
  #skip_before_action :check_user, only: :destroy

  #GET /resource/sign_in
  def new
    super
  end

  #POST /resource/sign_in
  def create
    super
  end

  #DELETE /resource/sign_out
  def destroy
    session[:user_id] = nil
    redirect_to admin_dashboard_path
    super
  end


  protected

  #If you have extra params to permit, append them to the sanitizer.
  def initialize(*)
    super
    permit(:sign_up, keys: [:username, :email])
  end
end
