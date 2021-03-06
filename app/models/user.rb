class User < ApplicationRecord
  validates_presence_of :name

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
  has_many :event_attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, foreign_key: 'attendee_id', through: 'event_attendances', class_name: 'Event'
end
