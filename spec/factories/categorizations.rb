# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  restaurant_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorization do
    category nil
    restaurant nil
  end
end
