module UsersHelper
  def is_admin
    @event = Event.where(admin_id: 'user.id')
    !current_user.nil? && current_user.id == @event.admin_id
  end
end
