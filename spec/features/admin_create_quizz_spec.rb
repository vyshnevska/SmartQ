require 'rails_helper'

feature 'Admin creates quizz' do
  scenario 'create new quizz without category', :js => true, :driver => :webkit do
    admin_sign_in
    visit admin_quizzs_path
    expect(page).to have_content( I18n.t('views.quizzes.warning_box.no_quizz'))
    expect(page).to have_content( I18n.t('views.quizzes.warning_box.details'))

    # Create quizz via popup
    click_link 'New'
    within '.modal-body' do
      find('#quizz_title').set('title1')
    end
    click_button 'Create'

    within '#alert-notifications' do
      expect(page).to have_content(I18n.t('controllers.quizzes.created', :quizz => 1))
    end
    page.find('#quizzes_list').should have_text('title1')
  end

  scenario 'create new quizz with category', :js => true, :driver => :webkit do
    admin_sign_in
    set_category
    visit admin_quizzs_path

    # Create quizz via popup
    click_link 'New'
    within '.modal-body' do
      find('#quizz_title').set('title1')
      select @category.title, :from => "quizz[category_id]"
    end
    click_button 'Create'

    within '#alert-notifications' do
      expect(page).to have_content(I18n.t('controllers.quizzes.created', :quizz => 1))
    end

    # Check if quizz was added to the list
    page.find('#quizzes_list').should have_text('title1')
  end
end