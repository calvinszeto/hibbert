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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :source do
		name "Super Food Blog"
		category "Blog"
		website "www.yummy-example.com"
		description "2014 Awards"
  end
end
