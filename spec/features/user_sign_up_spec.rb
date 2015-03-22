require 'rails_helper'

feature 'User signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'joe_example', 'joe@example.com', 'passw0rd'

    expect(page).to have_content(I18n.t('devise.custom_registrations.signed_up'))
    expect(page.current_path).to eq(root_path)
  end

  scenario 'with invalid email' do
    sign_up_with 'joe_example', 'invalid_email', 'passw0rd'

    expect(page).to have_content(I18n.t('general.devise.sign_in'))
  end

  scenario 'with blank password' do
    sign_up_with 'joe_example', 'joe@example.com', ''

    expect(page).to have_content(I18n.t('general.devise.sign_in'))
  end

  scenario 'with blank name' do
    sign_up_with '', 'joe@example.com', 'passw0rd'

    expect(page).to have_content(I18n.t('general.devise.sign_in'))
  end
end