class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def show
    @events = Event.where(admin: current_user)
    @participations = Attendance.where(participant: current_user)
  end

end
