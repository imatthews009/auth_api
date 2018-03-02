class UsersController < ApplicationController
   # Use Knock to make sure the current_user is authenticated before completing request.
   before_action :authenticate_user,  only: [:index, :current, :update]
   before_action :authorize_as_admin, only: [:destroy]
   before_action :authorize,          only: [:update]
   
   # Should work if the current_user is authenticated.
   def index
     render json: {status: 200, msg: 'Logged-in'}
   end
   
   # Call this method to check if the user is logged-in.
   # If the user is logged-in we will return the user's information.
   def current
     current_user.update!(last_login: Time.now)
     render json: current_user
   end
   
   private
   

   def user_params
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
   end
   
   # Adding a method to check if current_user can update itself. 
   # This uses our UserModel method.
   def authorize
     return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
   end
end
