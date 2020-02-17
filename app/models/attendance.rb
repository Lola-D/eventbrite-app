class Attendance < ApplicationRecord
  
  belongs_to :participant, class_name: 'User'
  belongs_to :event
  
  after_create :new_attendance_send

  def new_attendance_send
    UserMailer.new_attendance_email(self).deliver_now
  end

end
