class Admin::RegistrationsController < Devise::RegistrationsController

def admin_sign_up_params
  params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
end

def admin_account_update_params
  params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
end

end
