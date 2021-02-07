require 'rails_helper'

RSpec.describe EventAttendance, type: :model do
  context 'Association' do
    it 'should belong to a attendee' do
      should belong_to(:attendee)
    end

    it 'should belong to an attended_event' do
      should belong_to(:attended_event)
    end
  end
end
