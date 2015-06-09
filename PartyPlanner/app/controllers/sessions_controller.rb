class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
      @user = User.find_by(name: params[:username])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to(user_path(@user))
      else
          flash[:error] = "Incorrect Username or Password"
          redirect_to(login_path)
      end
  end

  # def end
  #   redirect_to(end_session_path)
  # end


  def destroy
    reset_session
    
    render template: "sessions/end"
  end

end
