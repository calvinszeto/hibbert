# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  no_show_sources     :integer          default([]), is an Array
#  no_show_restaurants :integer          default([]), is an Array
#  tried_restaurants   :integer          default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_preference do
  end
end
