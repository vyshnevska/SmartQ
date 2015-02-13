require 'rails_helper'
# require 'pry'

feature 'User signs up' do
  scenario 'with valid credentials' do
    visit new_user_registration_path

    fill_in 'Name', with: 'joe_example'
    fill_in 'Email', with: 'joe@example.com'
    fill_in 'Password', with: 'passw0rd' 
    fill_in 'Password confirmation', with: 'passw0rd' 
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

end
