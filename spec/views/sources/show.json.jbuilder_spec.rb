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

	context "with user signed in" do
		it "should show no_show preference" do
			user = FactoryGirl.create :user
			source = FactoryGirl.create :source
			sign_in user
			user.add_no_show_source source
			assign(:source, source)
			assign(:user, user)
			render
			expect(JSON.parse(rendered)).to have_key("no_show")
			expect(JSON.parse(rendered)["no_show"]).to eq(true)
		end
	end
end
