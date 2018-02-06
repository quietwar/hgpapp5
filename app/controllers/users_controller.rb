class UsersController < Devise::RegistrationsController
          before_action :authenticate_user!
          before_action user_params:
          before_create :create_login

#permit_params :first_name, :last_name, :city, :cohort, :email, :email2, :avatar, :username, :project
# require 'google/api_client'
# require 'google/api_client/client_secrets'


  def new
    @user = User.new
  end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
     if @user.save!
       redirect_to root_path
     else
       @user = User.new(set_user_params)
       respond_to do |format|
       format.html { redirect_to @user }
       format.js
       # create.js.erb
       # destroy.js.erb
     #  user_password = params[:session][:password]
     #  user_email = params[:session][:email]
     #  user = user_email.present? && User.find_by(email: :user_email)

     #  if user && valid_password? user_password
     #    sign_in user, store: false
     #    user.generate_authentication_token!
     #    user.save
     #    render json: user, status: 200, location: [:api, :user]
     #  else
     #    render json: { errors: "Invalid email or password" }, status: 422
     #  end
    end
  end


  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
  def index
     @users = User.all
     @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
        marker.title user.title
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
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
end
