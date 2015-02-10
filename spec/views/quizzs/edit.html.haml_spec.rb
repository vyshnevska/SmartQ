require 'rails_helper'

RSpec.describe "quizzs/edit", :type => :view do
  before(:each) do
    @quizz = assign(:quizz, Quizz.create!(
      :category => "MyString"
    ))
  end

  it "renders the edit quizz form" do
    render

    assert_select "form[action=?][method=?]", quizz_path(@quizz), "post" do

      assert_select "input#quizz_category[name=?]", "quizz[category]"
    end
  end
end
