class UsersController < ApplicationController

  def index
    if logged_in?
      render :show
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @user = User.find(current_user.id)
    else
      @user = nil
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Thanks for signing up! Welcome to the Task List App!"
      redirect_to users_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
