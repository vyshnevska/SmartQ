require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid email and password' do
    user_sign_in

    within '#alert-notifications' do
      expect(page).to have_content('Signed in successfully.')
    end
    expect(page.current_path).to eq(root_path)
  end

  scenario 'with invalid email' do
    user_sign_in({ :email => 'email' })

    within '#alert-notifications' do
      expect(page).to have_content('Invalid email or password.')
    end
  end

  scenario 'with invalid password' do
    user_sign_in({ :password => 'pass' })

    within '#alert-notifications' do
      expect(page).to have_content('Invalid email or password.')
    end
  end
end