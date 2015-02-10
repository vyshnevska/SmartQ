require 'rails_helper'

RSpec.describe "Quizzs", :type => :request do
  describe "GET /quizzs" do
    it "works! (now write some real specs)" do
      get quizzs_path
      expect(response).to have_http_status(200)
    end
  end
end
