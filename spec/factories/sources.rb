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
		sequence(:name) {|n| "source#{n}"}
		category "Blog"
		website {"www.#{name}.com"}
		description "The #1 source on yummy delights."
  end
end
