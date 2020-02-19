module UsersHelper
  def is_admin
    @event = Event.find(params[:id])
    !current_user.nil? && current_user.id == @event.admin_id
  end
end
