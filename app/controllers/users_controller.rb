class UsersController < ApplicationController
  def edit
    # @user = User.find(params[:id])  #edit.html.erbのヘルパーメソッドform_withのmodelが@userのときにはこう書く．
  end

  def update
    # @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
