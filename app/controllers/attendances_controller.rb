class AttendancesController < ApplicationController

  # def new
  #   @event = Event.find(params[:id])
  # end

  # def create
  #   @event = Event.find(params['event_id'])
  #   @participant = current_user.id
  #   @attendance = @event.attendances.create(attendance_params)
  #   if @attendance.save
  #     flash[:success] = "Le Commentaire a bien été créé !"
  #     redirect_to event_path(@event.id)
  #   else
  #     flash[:danger] = "Le Commentaire n'a pas été créé !"
  #     render event_path(@event.id)
  #   end
  # end

  # private

  # def attendance_params
  #   params.require(:attendance).permit(:stripe_customer_id))
  # end

end
