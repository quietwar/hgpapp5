class UsersController < Devise::RegistrationsController
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => {email: true, login: false}
before_action :configure_users_params, only: [:create, :new]
#permit_params :first_name, :last_name, :city, :cohort_id, :email, :avatar, :project
Rails.logger.info(@users.errors.inspect)
 def index
   @users = User.all
   @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.title user.title
 end

 def new
   byebug
   @user = User.new
 end

 def create
   @user = User.new(set_user_params)
    if @user.save!
      redirect_to root_path
    else
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

 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

 def show
   @users = User.find_by(params[:id])
 end


 end

 private
#params[:product][:data].try(:keys))
 def user_params
   params.require(:user).permit(:first_name, :last_name, :city, :cohort_id, :email, :avatar, product: params[:app_name, :coding, :project_details, :start_date
])
 end

 def authenticate_user!
  unless current_user
     flash[:alert] = "Unauthorized Access: Genius, try again!"
     redirect_to root_path
   end
 end

end
