class UsersController < ApplicationController
  before_action :ensure_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name)
  end
end
