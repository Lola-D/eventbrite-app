class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
    @event = Event.find(params['id'])
  end

  def create
    @event = Event.find(params['event_id'])
    @attendance = Attendance.create(attendance_params)

    if @attendance.save
      flash[:success] = "Le paiement à bien été effectué !"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Le paiement n'a pas été effectué"
      redirect_to attendances_path
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :user_id)
  end

end
