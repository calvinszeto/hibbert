# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  recent_addresses    :string(255)
#  recent_categories   :string(255)
#  no_show_sources     :string(255)
#  no_show_restaurants :string(255)
#  tried_restaurants   :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_preference do
    user nil
    recent_addresses "MyString"
    recent_categories "MyString"
    no_show_sources "MyString"
    no_show_restaurants "MyString"
    tried_restaurants "MyString"
  end
end
