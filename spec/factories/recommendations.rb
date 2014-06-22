# == Schema Information
#
# Table name: recommendations
#
#  id               :integer          not null, primary key
#  restaurant_id    :integer
#  source_id        :integer
#  date_recommended :date
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recommendation do
  end
end
