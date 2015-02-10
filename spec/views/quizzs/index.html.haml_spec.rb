require 'rails_helper'

RSpec.describe "quizzs/index", :type => :view do
  before(:each) do
    assign(:quizzs, [
      Quizz.create!(
        :category => "Category"
      ),
      Quizz.create!(
        :category => "Category"
      )
    ])
  end

  it "renders a list of quizzs" do
    render
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
