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
		ignore do
			distance 0
		end

		sequence(:street) {|n| "#{n} street"}
    city "Buford"
    state "WY"
    zip_code 82052
		latitude 20
		longitude {20 + distance / 6.5 * 0.1 }
  end
end
