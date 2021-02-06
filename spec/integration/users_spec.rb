require 'rails_helper'

RSpec.describe 'Events', type: :feature do
  let(:user_a) { User.new(name: 'Sid') }
  let(:user_b) { User.new(name: 'J.C.') }
  let(:event) { Event.new(creator_id: user_a.id, description: 'COVID19 Vaccination', date: DateTime.current) }

  def log_in(user)
    visit '/login'
    fill_in 'Name', with: user.name
    click_button 'Log in'
    sleep(3)
  end

  context 'views:' do
    it "lists user's created events on their show page" do
      user_a.save
      log_in(user_a)
      event.save
      visit user_path(user_a)

      expect(page).to have_content event.description
    end

    it "allows a user to attend an event from the 'events' index page" do
      user_a.save
      log_in(user_a)
      event.save
      user_b.save
      log_in(user_b)
      visit event_path(event)
      click_on 'Attend this Event'

      expect(page).to have_selector 'div.alert', text: 'Event attendance was successfully confirmed.'
    end

    it 'lists all registered users' do
      user_a.save
      visit '/users'

      expect(page).to have_content user_a.name
    end
  end
end
