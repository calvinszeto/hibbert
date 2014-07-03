# == Schema Information
#
# Table name: recommendation_groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  website     :string(255)
#  source_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  date        :date
#  description :text
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :recommendation_group do
		sequence(:name) {|n| "recommendation_group#{n}"}
    source
    website "www.#{name}.org"
		date DateTime.now
		description "#{source.name}'s top 10 list of restaurants for #{date}"

		factory :recommendation_group_with_recommendations do
			ignore do
				recommendations_count 10
			end

			after(:create) do |recommendation_group, evaluator|
				create_list(:recommendation, evaluator.recommendations_count,
										recommendation_group: recommendation_group)	
			end
		end
  end
end
