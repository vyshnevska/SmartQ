require 'rails_helper'

RSpec.describe "answers/new", :type => :view do
  before(:each) do
    assign(:answer, Answer.new(
      :title => "MyString",
      :question_id => 1,
      :correct => false
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_title[name=?]", "answer[title]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_correct[name=?]", "answer[correct]"
    end
  end
end
