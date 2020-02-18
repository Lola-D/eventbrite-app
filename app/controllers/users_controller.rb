class UsersController < ApplicationController

  before_action :authenticate_user

  def show
    @events = Event.find_by(params['admin_id'])
    @user = User.find(params['id'])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(first_name: params['first_name'], last_name: params['last_name'], description: params['description'])
      redirect_to user_path(@user.id)
      flash[:success] = "Ton profil a bien été édité !"
    else
      render edit_user_path(@user.id)
      flash[:danger] = "Ton profil n'a pas été édité !"
    end
  end

end
