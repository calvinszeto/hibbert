# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  street         :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip_code       :integer
#  latitude       :float
#  longitude      :float
#  addressable_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    city "MyString"
    state "MyString"
    zip_code 1
    latitude 1.5
    longitude 1.5
    addressable nil
  end
end
