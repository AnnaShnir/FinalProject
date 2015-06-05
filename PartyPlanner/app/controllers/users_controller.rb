class UsersController < ApplicationController
	before_action :authenticate

private

	def user_params
		params.require(:user).permit(:name, :email, :calendar_entry)
	end
end
