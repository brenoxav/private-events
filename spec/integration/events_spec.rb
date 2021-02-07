require 'rails_helper'

RSpec.describe 'Events', type: :feature do
  let(:user) { User.new(name: 'Sid') }
  let(:event) { Event.new(creator_id: user.id, description: 'COVID19 Vaccination', date: DateTime.current) }

  def log_in(user)
    visit '/login'
    fill_in 'Name', with: user.name
    click_button 'Log in'
    sleep(3)
  end

  def select_date_input(date_time)
    select date_time.strftime('%Y'), from: 'event_date_1i'
    select date_time.strftime('%B'), from: 'event_date_2i'
    select date_time.strftime('%-d'), from: 'event_date_3i'
    select date_time.strftime('%H'), from: 'event_date_4i'
    select date_time.strftime('%M'), from: 'event_date_5i'
  end

  context 'views:' do
    it 'does not allow event creation without beign logged in' do
      visit '/events/new'
      fill_in 'Description', with: event.description
      select_date_input event.date
      click_on 'Create Event'
      sleep(3)

      expect(page).to have_selector 'div.alert', text: 'You need to be logged in to create an event.'
    end

    it 'creates an event through form' do
      user.save
      log_in(user)
      visit '/events/new'
      fill_in 'Description', with: event.description
      select_date_input event.date
      click_on 'Create Event'
      sleep(3)

      expect(page).to have_selector 'div.alert', text: 'Event was successfully created.'
    end

    it 'lists all created events' do
      user.save
      event.save
      visit '/events'

      expect(page).to have_content event.description
    end
  end
end
