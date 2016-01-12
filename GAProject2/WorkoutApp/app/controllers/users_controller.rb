class UsersController < ApplicationController
   #This method is working. users/ is redirecting to sessions/new 
 def index
   @users = User.all
   user = User.first
   @exercise = user.exercises

   unless logged_in?
     redirect_to "/sessions/new"
   end
 end

 def create
   if logged_in?
     redirect_to root_path
   end
   @user = User.new(user_params)
   if @user.save
     # session[:user_id] = user.id
     redirect_to action: "index"
   else 
     render "new"   
   end 
 end

 def new
   if logged_in?
     redirect_to root_path
   end

   @user = User.new

 end

 private 
 def user_params

   params.require(:user).permit(:username, :email, :password, :password_confirmation)

 end

end