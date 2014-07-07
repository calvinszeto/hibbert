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

class Address < ActiveRecord::Base
  belongs_to :addressable

	# Add validations here

	geocoded_by :full_address
	after_validation :geocode, if: :address_changed?

	def full_address
		return [street, city, state, zip_code].join(" ")
	end

	def address_changed?
		street_changed? || city_changed? || state_changed? || zip_code_changed?
	end
end
