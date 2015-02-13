require 'rails_helper'

feature 'User Login' do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario 'Signing in with valid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    within '#alert-notifications' do
      expect(page).to have_content('Signed in successfully.')
    end
  end

  scenario "User tries to sign in with invalid password" do
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'pass'
    click_button 'Sign in'

    within '#alert-notifications' do
      expect(page).to have_content('Invalid email or password.')
    end
  end
end
