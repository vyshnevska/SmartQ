require 'rails_helper'

feature 'Admin edits quizz' do
  scenario 'update existing quizz with category', :js => true, :driver => :webkit do
    admin_sign_in
    create_quizz
    visit admin_quizzs_path
    page.find('#quizzes_list').find("#quizz-line-#{@quizz1.id}").click_link('Edit')

    # Update all fields
    within(:css, "#edit_quizz_#{@quizz1.id} .modal-body") do
      find('#quizz_title').set(@quizz1.title + " new")
    end

    within(:css, "#edit_quizz_#{@quizz1.id}") do
      find("#question-#{@question1.id}").first('#title').set(@question1.title + " new")

      @answers.each do |answer_id, answer_title|
        find("#answer-#{answer_id} #title").set(answer_title+" new")
      end
    end

    # Check updated data
    titles = page.all("#question-#{@question1.id} #title")
    page.find_field('quizz_title').value.should have_text(@quizz1.title+" new")
    titles[0].value.should have_text(@question1.title + " new")

    @answers.values.each_with_index do |answer_title, index|
      titles[index+1].value.should have_text(answer_title+" new")
    end

    click_button 'Update'
    page.find('#alert-notifications').text.should have_text(I18n.t('controllers.quizzes.updated', :quizz => @quizz1.id))
  end
end