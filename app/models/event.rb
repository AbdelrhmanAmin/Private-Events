class Event < ApplicationRecord
  after_save :auto_populate_creator
  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attendees, dependent: :destroy
  has_many :attendances, through: :attendees, source: :attendee
  
  def auto_populate_creator
    self.attendances << self.creator
  end

  scope :old_events, -> { where(['events.date < ?', Date.today])}
  scope :coming_events, -> { where(['events.date > ?', Date.today])}
end
