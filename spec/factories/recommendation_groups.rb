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
    name "MyString"
    website "MyString"
    source nil
  end
end
