require 'rails_helper'

feature 'Admin signs in' do
  scenario 'with valid email and password' do
    admin_sign_in

    within '#alert-notifications' do
      expect(page).to have_content('Signed in successfully.')
    end
    expect(page.current_path).to eq(admin_root_path)
  end

  scenario 'with invalid email' do
    admin_sign_in({ :email => 'email' })

    within '#alert-notifications' do
      expect(page).to have_content('Invalid email or password.')
    end
  end

  scenario 'with invalid password' do
    admin_sign_in({ :password => 'pass' })

    within '#alert-notifications' do
      expect(page).to have_content('Invalid email or password.')
    end
  end
end