class SessionsController < ApplicationController
  def new

  end

  def create
    # byebug
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      flash[:success] = "Thanks for logging in! Welcome to the Task List App!"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
