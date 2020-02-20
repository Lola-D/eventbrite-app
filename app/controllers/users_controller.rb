class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @events = Event.find_by(params['admin_id'])
    @user = User.find(params['id'])
  end

end
