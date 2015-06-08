class UsersController < ApplicationController
	before_action :authenticate, except: [:new, :create]

	def show

		@user = User.find(session[:user_id])
	end
	
	def create
		@user = User.find_by(email: params[:email])

		if @user
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else

			@user = User.create(user_params)
			if @user.save
				session[:user_id] = @user.id
				redirect_to user_path(@user)
			else
				render template: "sessions/new"
			end
		end
	end


private

	def user_params
		params.require(:user).permit(:name, :email, :calendar_entry)
	end
end
