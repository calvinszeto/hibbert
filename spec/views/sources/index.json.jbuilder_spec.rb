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
end
