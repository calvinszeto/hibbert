require 'rails_helper'

RSpec.describe "sources/index", type: :view do
	it "should return all sources" do
		assign(:sources, FactoryGirl.create_list(:source, 5))
		assign(:no_filter, false)
		render
		expect(JSON.parse(rendered).count).to eq(Source.count)
	end

	context "with :no_filter=true" do
		it "should return no_show status" do
			user = FactoryGirl.create :user
			sign_in user
			bad_source = FactoryGirl.create :source
			user.add_no_show_source bad_source

			assign(:sources, FactoryGirl.create_list(:source, 5) + [bad_source])
			assign(:user, user)
			assign(:no_filter, true)

			render
			expect(JSON.parse(rendered).first).to have_key("no_show")
			expect(JSON.parse(rendered)
						 .select{|s| s["id"] == bad_source.id}.first["no_show"]).to eq(true)
		end
	end
	
	context "with :location=error" do
		it "should return an error message" do
			assign(:sources, FactoryGirl.create_list(:source, 3))
			assign(:location, "error")
			render
			expect(JSON.parse(rendered).first).to have_key("error")
			expect(JSON.parse(rendered).first["error"]).not_to be_empty
		end
	end

	context "with valid :location" do
		it "should return nearby_restaurants_count and searched_location" do
			assign(:sources, FactoryGirl.create_list(:source, 3))
			Source.all.each {|s| s.nearby_restaurants_count = 3}
			assign(:location, "123 Fake St.")
			render
			expect(JSON.parse(rendered).first).to have_key("nearby_restaurants_count")
			expect(JSON.parse(rendered).first).to have_key("searched_location")
		end
	end
end
