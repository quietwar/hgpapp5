class Admin::SessionsController < Devise::RegistrationsController

  def sign_up_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
