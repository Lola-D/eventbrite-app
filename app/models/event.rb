class Event < ApplicationRecord

  validate :is_in_the_future?
  validate :is_multiple_of_5?
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :price, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 1000 }
  validates :location, presence: true
  validates :eventimage, presence: true

  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :participants, through: :attendances
  has_one_attached :eventimage

  def end_date
    start_date + duration.minutes
  end

  def is_in_the_future?
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def is_multiple_of_5?
    if duration.present? && duration % 5 != 0 && duration > 0
      errors.add(:duration, "must be a multiple of 5")
    end
  end
  
end