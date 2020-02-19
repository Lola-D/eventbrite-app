module UsersHelper

  def is_admin
    current_user.id.to_i == params[:id].to_i
  end

end
