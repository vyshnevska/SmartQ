require 'rails_helper'

feature 'Admin edits quizz' do
  scenario 'update existing quizz with category', :js => true, :driver => :webkit do
    admin_sign_in
    create_quizz
    visit admin_quizzs_path
    page.find('#quizzes_list').find("#quizz-line-#{@quizz1.id}").click_link('Edit')

    # Update quizz fields
    within(:css, "#edit_quizz_#{@quizz1.id} .modal-body") do
      find('#quizz_title').set(@quizz1.title + " new")
    end

    quest_field_values, answ_field_values = [], []
    # Update all questions fields
    @questions.each do |question_id, question_title|
      find("#question-#{question_id} > div[class='form-group'] > div[class='col-sm-8'] > #title").set(question_title+" new")
      quest_field_values << find("#question-#{question_id} > div[class='form-group'] > div[class='col-sm-8'] > #title").value
    end
    # Update all answers fields
    @answers.each do |answer|
      answer.each do |answer_id, answer_title|
        find("#answer-#{answer_id} > div[class='form-group'] > div[class='col-sm-4'] > #title").set(answer_title+" new")
        answ_field_values << find("#answer-#{answer_id} > div[class='form-group'] > div[class='col-sm-4'] > #title").value
      end
    end

    # Check values
    page.find_field('quizz_title').value.should have_text(@quizz1.title+" new")
    @questions.values.sort.each_with_index do |title, index|
      quest_field_values.sort[index].should have_text(title+' new')
    end
    @answers.map(&:values).flatten(1).sort.each_with_index do |title, index|
      answ_field_values.sort[index].should have_text(title+' new')
    end

    click_button 'Update'
    sleep 3
    page.find('#alert-notifications').text.should have_text(I18n.t('controllers.quizzes.updated', :quizz => @quizz1.id))
  end
end