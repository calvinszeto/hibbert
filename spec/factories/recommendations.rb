# == Schema Information
#
# Table name: recommendations
#
#  id                      :integer          not null, primary key
#  restaurant_id           :integer
#  created_at              :datetime
#  updated_at              :datetime
#  recommendation_group_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recommendation do
		restaurant
		recommendation_group
  end
end
