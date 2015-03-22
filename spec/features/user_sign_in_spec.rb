require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid email and password' do
    user_sign_in

    within '#alert-notifications' do 
      expect(page).to have_content(I18n.t('devise.custom_sessions.signed_in'))
    end
    expect(page.current_path).to eq(root_path)
  end

  scenario 'with invalid email' do
    user_sign_in({ :email => 'email' })

    within '#alert-notifications' do
      expect(page).to have_content(I18n.t('devise.failure.not_found_in_database', :authentication_keys => 'email'))
    end
  end

  scenario 'with invalid password' do
    user_sign_in({ :password => 'pass' })

    within '#alert-notifications' do
      expect(page).to have_content(I18n.t('devise.failure.not_found_in_database', :authentication_keys => 'email'))
    end
  end
end