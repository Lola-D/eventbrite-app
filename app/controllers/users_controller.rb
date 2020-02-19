class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @events = Event.find_by(params['admin_id'])
    @user = User.find(params['id'])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success] = "Ton profil a bien été édité !"
    else
      render edit_user_path(@user.id)
      flash[:danger] = "Ton profil n'a pas été édité !"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end
