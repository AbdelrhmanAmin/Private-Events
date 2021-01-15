require 'rails_helper'

RSpec.describe 'User interactions', type: :feature do
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
  scenario 'sign in' do
    User.create!(name: 'Neko', email: 'swag@yolo.com', password: '123456')
    visit new_user_session_path
    fill_in 'Email', with: 'swag@yolo.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
