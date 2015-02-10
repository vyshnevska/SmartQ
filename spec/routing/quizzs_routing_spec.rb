require "rails_helper"

RSpec.describe QuizzsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quizzs").to route_to("quizzs#index")
    end

    it "routes to #new" do
      expect(:get => "/quizzs/new").to route_to("quizzs#new")
    end

    it "routes to #show" do
      expect(:get => "/quizzs/1").to route_to("quizzs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quizzs/1/edit").to route_to("quizzs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quizzs").to route_to("quizzs#create")
    end

    it "routes to #update" do
      expect(:put => "/quizzs/1").to route_to("quizzs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quizzs/1").to route_to("quizzs#destroy", :id => "1")
    end

  end
end
