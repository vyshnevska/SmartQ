require 'rails_helper'

feature 'User creates new quizz' do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario 'create new quizz', :js => true, :driver => :webkit do
    # User signs in successfully
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    within '#alert-notifications' do
      expect(page).to have_content('Signed in successfully.')
    end
    # Opens create popup
    click_link 'New'
    within '.modal-body' do
      find('#quizz_title').set('title1')
      find(:css, "#category_level_multiple").set(true)
    end
    click_button 'Create'

    # Successfully close popup
    within '#alert-notifications' do
      expect(page).to have_content('Quizz 1 was successfully created')
    end

    # Check if quizz was added to the list
    page.find('#quizzes_list').should have_text('title1')
  end
end
