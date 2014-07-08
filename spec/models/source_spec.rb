# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category    :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

require 'rails_helper'

RSpec.describe Source, :type => :model do
	before(:each) do
		@source = FactoryGirl.create(:source)
	end

	context "scope showable" do
		it "should return all sources if user has no no_show_sources" do
			user = FactoryGirl.create(:user)
			expect(Source.showable(user).to_a).to eq([@source])
		end

		it "should return sources which are not in the user's no_show_sources" do
			user = FactoryGirl.create(:user)
			bad_source = FactoryGirl.create(:source)
			user.add_no_show_source(bad_source)
			expect(Source.showable(user).to_a).to eq([@source])
		end
	end

end
