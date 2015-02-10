require 'rails_helper'

RSpec.describe "answers/edit", :type => :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :title => "MyString",
      :question_id => 1,
      :correct => false
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input#answer_title[name=?]", "answer[title]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_correct[name=?]", "answer[correct]"
    end
  end
end
