module UsersHelper

  def is_admin
    @event = Event.find(params['id'])
    !current_user.nil? && current_user.id == @event.admin_id
  end

  def current_user_profil
    current_user.id.to_i == params[:id].to_i
  end

  def already_participant
    # @events = Event.where(admin: current_user)
    # @participations = Attendance.where(participant: current_user)
  end
end
