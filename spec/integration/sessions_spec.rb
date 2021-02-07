require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  let(:user) { User.create(name: 'Sid') }

  describe 'the signup process' do
    it 'signs user up' do
      visit '/users/new'
      fill_in 'Name', with: user.name
      click_button 'Create User'

      expect(page).to have_selector 'h1', text: user.name
    end
  end

  describe 'the login process' do
    it 'logs user in' do
      visit '/login'
      fill_in 'Name', with: user.name
      click_button 'Log in'

      expect(page).to have_selector 'a.nav-link', text: user.name
    end
  end
end
