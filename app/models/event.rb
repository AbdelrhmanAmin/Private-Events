class Event < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attendees
  has_many :attendances, through: :attendees, source: :attendee

  scope :old_events, -> { where(['events.date < ?', Date.today])}
  scope :coming_events, -> { where(['events.date > ?', Date.today])}
end
