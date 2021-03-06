# == Schema Information
#
# Table name: categories
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  categorizations_count :integer          default(0)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
		sequence(:name) {|n| "restaurant_category#{n}"}
  end
end
