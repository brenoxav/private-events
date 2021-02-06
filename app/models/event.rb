class Event < ApplicationRecord
  validates_presence_of :description, :date

  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: 'event_attendances', source: 'attendee', class_name: 'User', foreign_key: 'user_id'

  scope :past, -> { where('date < ?', Time.current).order('date DESC') }
  scope :future, -> { where('date >= ?', Time.current).order('date ASC') }
end
