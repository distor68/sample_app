class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  end
	def create 
		@user = User.create(user_param)
		if @user.save 
			sign_in @user
			flash[:success] = "Welcome to the Sample App"
			redirect_to @user
		else
			render 'new'	
		end	
	end

	private
		def user_param
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
			
		end
end
