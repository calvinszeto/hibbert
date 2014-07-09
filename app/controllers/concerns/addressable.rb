module Addressable
	extend ActiveSupport::Concern

	included do
		has_many :addresses, as: :addressable
		attr_accessor :distance
	end
	
	# Delegate Address attributes and methods to the first address
	def method_missing(meth, *args, &block)
		methods = [:street, :city, :state, :zip_code, :latitude, :longitude]
		if methods.include? meth
			addresses.first[meth]
		else
			super
		end
	end

	module ClassMethods
		# Returns addressables near the given location, ordered by ascending distance
		# This is a method instead of a scope because the 'distance' attributes
		# returned from Geocoder are needed in this application, but aren't in
		# the database.
		def near(addressables, location, distance)
			adrs = Address.near(location, distance)
			adrbs = addressables.where(id: adrs.to_a.map(&:addressable_id)).to_a
			adrbs.each do |adrb|
				adrb.distance = adrs.select{|adr| adr.addressable_id == adrb.id}.first['distance']
			end
			adrbs.sort {|x,y| x.distance <=> y.distance}
		end
	end
end
