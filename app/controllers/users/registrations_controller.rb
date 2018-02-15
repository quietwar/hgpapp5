class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  include Accessible

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        flash[:notice] = "project has been created"
        redirect_to [:current_user, @project]
      else
        flash.now[:alert] = "project has not been created"
        render :new
      end
    end


   protected

  #  def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
  #  end
  #
  #
  #
  #  def sign_up_params
  #    params.require(:user).permit(:first_name, :last_name, :city, :cohort, :email, :password, :password_confirmation)
  #  end
  # # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  # #
  # # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  #
  # The path used after sign up.
  def after_sign_up_path_for(user)
    '/root_path/'
  end
  #
  # # The path used after sign up for inactive accounts.
  # # def after_inactive_sign_up_path_for(resource)
  # #   super(resource)
  # # end
end
