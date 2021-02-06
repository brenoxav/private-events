require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { Event.new(creator_id: 8, description: 'COVID19 Vaccination', date: DateTime.current + 6.months) }

  context 'Validation' do
    it 'is valid with valid properties' do
      subject.creator_id = 0
      expect(subject).to_not be_valid
    end

    it 'is not valid without description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Association' do
    it 'should belong to a creator' do
      should belong_to(:creator)
    end

    it 'should have many attendees' do
      should have_many(:attendees)
    end

    it 'should have many event_attendances' do
      should have_many(:event_attendances)
    end
  end
end
