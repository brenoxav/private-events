class AddIndexToEventAttendances < ActiveRecord::Migration[6.1]
  def change
    add_index :event_attendances, :attendee_id
    add_index :event_attendances, :attended_event_id
  end
end
