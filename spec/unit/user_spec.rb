require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe') }

  context 'Validation' do
    it 'is valid with a valid name' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
  context 'Association' do
    it 'should have many created_events' do
      should have_many(:created_events)
    end

    it 'should have many event_attendances' do
      should have_many(:event_attendances)
    end

    it 'should have many attended_events' do
      should have_many(:attended_events)
    end
  end
end
