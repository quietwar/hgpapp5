class RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # accepts_nested_attributes :project
  # permit_params :first_name, :last_name, :city, :cohort_id, :email
  #
  #
  # protected
  #
  # def sign_up_params
  #   params.require(:user).permit(:first_name, :last_name, :city, :cohort_id, :email, :password, :password_confirmation)
  # end
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(user_session_path)
   '/root_path/'
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  end


#   private
#
#   def sign_up_params
#     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
#   end
#
#   def account_update_params
#     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
#   end
#
# end
