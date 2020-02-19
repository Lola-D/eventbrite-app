module UsersHelper
  def is_admin
    !current_user.nil? && current_user.id == @event.admin.id
  end
end
