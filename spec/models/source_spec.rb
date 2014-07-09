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

	context "sources_near method" do
		it "should return only sources which have restaurants near the location" do
			allow_any_instance_of(Address).to receive(:geocode)
			restaurant = FactoryGirl.create(:restaurant)
			FactoryGirl.create :address, :addressable => restaurant
			near_source = restaurant.sources.first
		  far_restaurant = FactoryGirl.create(:restaurant)
			FactoryGirl.create :address, distance: 6, :addressable => far_restaurant
			far_source = far_restaurant.sources.first
	  	expect(Source.sources_near(Source.all, 
																		 [restaurant.latitude, restaurant.longitude],
																		5)).to match_array([near_source])
		end
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
