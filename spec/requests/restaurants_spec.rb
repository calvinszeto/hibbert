require 'rails_helper'

RSpec.describe "Restaurants", :type => :request do
  describe "GET /restaurants" do
    it "works! (now write some real specs)" do
      get restaurants_path
      expect(response.status).to be(200)
    end
  end
end
