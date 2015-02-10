require 'rails_helper'

RSpec.describe "quizzs/new", :type => :view do
  before(:each) do
    assign(:quizz, Quizz.new(
      :category => "MyString"
    ))
  end

  it "renders new quizz form" do
    render

    assert_select "form[action=?][method=?]", quizzs_path, "post" do

      assert_select "input#quizz_category[name=?]", "quizz[category]"
    end
  end
end
