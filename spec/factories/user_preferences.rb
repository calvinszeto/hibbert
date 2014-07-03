# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  no_show_sources     :string(255)      default([]), is an Array
#  no_show_restaurants :string(255)      default([]), is an Array
#  tried_restaurants   :string(255)      default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_preference do
  end
end
