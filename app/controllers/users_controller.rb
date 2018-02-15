class UsersController < Devise::RegistrationsController
          before_action :authenticate_user!, except: [:new, :create]
          before_action user_params:

#permit_params :first_name, :last_name, :city, :cohort, :email, :email2, :avatar, :username, :project
# require 'google/api_client'
# require 'google/api_client/client_secrets'


  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
  def index
     @users = User.excludes(:id => current_user.id)
     @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.title user.title
     end
  end

  def update
    authorize! :assign_roles, @user if params[:user][:assign_roles]
    # ...
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end



 private

 def create_login
    email = self.email.split(/@/)
    login_taken = User.where(login: email[0]).first
    self.login =
    if login_taken
      self.email
    else
      email[0]
    end
  end

  def self.find_for_database_authentication conditions
      where(login: conditions[:email]).first || where(email: conditions[:email]).first
  end
#params[:product][:data].try(:keys))

   # def user_params
   #   params.require(:user).permit(:first_name, :last_name, :city, :cohort, :email, :avatar, :username, project: [ :app_name, :coding, :project_details, :start_date])
   #   #params.permit(user: [ :first_name, :last_name, :city, :cohort, :email, :avatar, :username { projects: :app_name, :coding, :project_details, :start_date } ])
   # end

   def authenticate_user!
      unless current_user
         flash[:alert] = "Unauthorized Access: Genius, try again!"
         redirect_to root_path
       end
    end
end
