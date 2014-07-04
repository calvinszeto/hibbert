# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer          default(0)
#  sources_count         :integer          default(0)
#  website               :string(255)
#  sources_list          :integer          default([]), is an Array
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
		sequence(:name) {|n| "restaurant#{n}"}
		website {"www.#{name}.org"}

		after(:create) do |r| 
				FactoryGirl.create :recommendation, :restaurant => r
				r.categories << FactoryGirl.create(:category)
		end
  end
end
