class UsersController < ApplicationController
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

  # def current
  #   @current_user = current_user
  #   render json: @current_user
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name)
  end
end
