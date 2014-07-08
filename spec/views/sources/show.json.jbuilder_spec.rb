require 'rails_helper'

RSpec.describe "sources/show", type: :view do
	it "should return source attributes" do
		assign(:source, FactoryGirl.create(:source))
		render
		["id", "name", "category", "website", "description"].each do |key|
			expect(JSON.parse(rendered)).to have_key(key)
		end
	end

	it "should return recommendation groups" do
		rg = FactoryGirl.create(:recommendation_group)
		source = rg.source
		assign(:source, source)
		render
		expect(JSON.parse(rendered)).to have_key("recommendation_groups")
		expect(JSON.parse(rendered)["recommendation_groups"].
					 first).to have_key("recommendations_count")
		expect(JSON.parse(rendered)["recommendation_groups"].
					 first["recommendations_count"]).to eq(rg.recommendations.count)
	end
end
