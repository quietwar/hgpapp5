class UsersController < Devise::RegistrationsController
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :confirmations,
  #         :authentication_keys => {email: true, login: true}

before_action user_params: #only: => {create:, new:}
#permit_params :first_name, :last_name, :city, :cohort, :email, :email2, :avatar, :username, :project
# require 'google/api_client'
# require 'google/api_client/client_secrets'
 def index
   @users = User.all
   @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.title user.title
   end
  end

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
   @users = User.find_by(params[:id])
 end

 def destroy
   session[:user_id] = nil
   redirect_to root_path
 end



 private
#params[:product][:data].try(:keys))

 def user_params
   params.require(:user).permit(:first_name, :last_name, :city, :cohort, :email, :avatar, :username, project: [ :app_name, :coding, :project_details, :start_date])
   #params.permit(user: [ :first_name, :last_name, :city, :cohort, :email, :avatar, :username { projects: :app_name, :coding, :project_details, :start_date } ])
 end

 def authenticate_user!
    unless current_user
       flash[:alert] = "Unauthorized Access: Genius, try again!"
       redirect_to root_path
     end
  end
end
end
