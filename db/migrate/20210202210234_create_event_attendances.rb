class CreateEventAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendances do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
