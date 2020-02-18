class Event < ApplicationRecord

  validate :is_in_the_future?
  validate :is_multiple_of_5?
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :participants, through: :attendances

  def end_date
    self.start_date + self.duration * 60
  end

  def is_in_the_future?
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def is_multiple_of_5?
    if duration.present? && duration % 5 != 0 && duration > 0
      errors.add(:duration, "has to be a multiple of 5")
    end
  end
  
end