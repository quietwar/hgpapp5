class RegistrationsController < Devise::RegistrationsController
  wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  #accepts_nested_attributes :project
  permit_params :avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmark, :projects, :project, :project_ids

  POST /resource/sign_in
  # def create
  #   super
  # end
  def create
    super do
        resource.project_list = params[:project]
        resource.save
    end
  end
  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :city, :cohort_id, :email, :password, :password_confirmation, :project)
  end


  def project_params
    params.require(:project).permit(:app_name, :coding, :project_details, :start_date)
  end
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
  #end


  private

  def sign_up_params
    params.require(:user).permit(:cohort[:avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email,:email2, :cell, :password, :password_confirmation, :stipend, :benchmark, :projects,:project, :project_ids])
  end

  def account_update_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmark, :projects,:project, :project_ids
    )
  end

end
