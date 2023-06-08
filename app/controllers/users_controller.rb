class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
