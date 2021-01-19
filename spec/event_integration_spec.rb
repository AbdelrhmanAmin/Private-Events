require 'rails_helper'

RSpec.describe 'Event interactions', type: :feature do
  context "a context" do
    let!(:user) {create(:user)}
    scenario "Create new event if user logged" do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      click_link 'New Event'
      fill_in 'event[title]', with: "Let's Meditate!"
      fill_in 'event[date]', with: '08/03/2021'
      click_button 'Create Event'
      expect(page).to have_text("Let's Meditate!")
    end
    scenario "List all existing events seperated into past and upcoming if user logged" do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      click_link 'Homepage'
      expect(page).to have_text("Upcoming Events")
      expect(page).to have_text("Old Events")
    end
    scenario "Show creator of event if user logged" do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      click_link 'New Event'
      fill_in 'event[title]', with: "Let's Meditate!"
      fill_in 'event[date]', with: '08/03/2021'
      click_button 'Create Event'
      expect(page).to have_text("Creator")
    end
    scenario "Show Attendees of event if user logged" do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      click_link 'New Event'
      fill_in 'event[title]', with: "Let's Meditate!"
      fill_in 'event[date]', with: '08/03/2021'
      click_button 'Create Event'
      expect(page).to have_text("Attendees")
    end
  end
end