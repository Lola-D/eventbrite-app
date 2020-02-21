module UsersHelper

  def is_admin
    @event = Event.find(params['id'])
    !current_user.nil? && current_user.id == @event.admin_id
  end

  def current_user_profil
    current_user.id.to_i == params[:id].to_i
  end

  def already_participant
    Attendance.find_by(event_id: @event.id, participant_id: current_user.id)
  end  

end
