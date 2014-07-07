module Addressable
	extend ActiveSupport::Concern

	included do
		has_many :addresses, as: :addressable
		scope :near, ->(location, distance) {adrs = Address.near(location, distance);
																				where(id: adrs.to_a.map(&:addressable_id))}

		def method_missing(meth, *args, &block)
			# Delegate Address attributes and methods to the first address
			methods = [:street, :city, :state, :zip_code, :latitude, :longitude]
			if methods.include? meth
				addresses.first[meth]
			end
		end
	end
end
