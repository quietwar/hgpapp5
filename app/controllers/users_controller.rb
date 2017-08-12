class UsersController < ApplicationController

 def index

 end
 def create
     user_password = params[:session][:password]
     user_email = params[:session][:email]
     user = user_email.present? && User.find_by(email: user_email)

     if user &&  valid_password? user_password
       sign_in user, store: false
       user.generate_authentication_token!
       user.save
       render json: user, status: 200, location: [:api, user]
     else
       render json: { errors: "Invalid email or password" }, status: 422
     end
   end

 def show
 @user = User.find_by_username(params[:id])
 end

 def authenticate_admin!

  unless current_user.admin?
     flash[:alert] = "Unauthorized Access: Genius, go back!"
     redirect_to root_path
   end
 end

end
