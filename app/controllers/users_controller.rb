class UsersController < ApplicationController
  def new
		@user = User.new
	end
	
	def create
		byebug
		@user = User.new(user_params)
		byebug
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number)
	end

end