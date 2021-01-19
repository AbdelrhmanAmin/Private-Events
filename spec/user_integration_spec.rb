require 'rails_helper'

RSpec.describe 'User interactions', type: :feature do
  context 'a context' do
    let!(:user) { create(:user) }
    scenario 'sign up' do
      visit new_user_registration_path
      fill_in 'Name', with: 'NekoMaster'
      fill_in 'Email', with: 'swag@yolo.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    scenario 'sign in' do
      visit new_user_session_path
      fill_in 'Email', with: 'swag@yolo.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
    it 'sign in' do
      user.email = 'swag@yolo.com'
      user.password = '123456'
      user.save!
      visit new_user_session_path
      fill_in 'Email', with: 'swag@yolo.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
    scenario 'Should return ALL events created by the user' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      click_on user.name
      expect(page).to have_text('HOSTED')
      expect(page).to have_text('HOSTING')
    end
    scenario 'Should return events user will attend and did attend' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      click_on user.name
      expect(page).to have_text('ATTENDING')
      expect(page).to have_text('ATTENDED')
    end
  end
end
