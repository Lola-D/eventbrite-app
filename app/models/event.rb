class Event < ApplicationRecord

  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :participants, through: :attendances

  def end_date
    self.start_date + self.duration * 60
  end
  
end