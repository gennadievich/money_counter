class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spendings = @user.spendings
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_path
    else
      render new
    end

  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
