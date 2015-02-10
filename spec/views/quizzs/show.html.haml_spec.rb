require 'rails_helper'

RSpec.describe "quizzs/show", :type => :view do
  before(:each) do
    @quizz = assign(:quizz, Quizz.create!(
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
  end
end
