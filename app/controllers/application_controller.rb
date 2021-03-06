class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  include UsersHelper

  protected
  
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :avatar)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password, :avatar)}
  end

end
