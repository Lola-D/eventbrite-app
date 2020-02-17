class UserMailer < ApplicationMailer

  default from: 'no-reply@your-best-events.fr'
  def welcome_email(user)
    @user = user 
    @url  = 'http://your-best-events.herokuapp.com//login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_attendance_email(attendance)
    @admin = attendance.event.admin
    @url  = 'http://your-best-events.herokuapp.com//login' 
    mail(to: @admin.email, subject: 'Nouveau participant !') 
  end

end
