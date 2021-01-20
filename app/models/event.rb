class Event < ApplicationRecord
  after_save :auto_populate_creator
  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attendees, dependent: :destroy
  has_many :attendances, through: :attendees, source: :attendee

  def auto_populate_creator
    attendances << creator if attendances.empty?
  end

  def included?(user)
    attendance_ids.include?(user.id)
  end

  def created_by?(user)
    creator_id != user.id
  end
  scope :old_events, -> { where(['events.date < ?', Date.today]) }
  scope :coming_events, -> { where(['events.date >= ?', Date.today]) }
end
