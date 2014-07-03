module Addressable
	extend ActiveSupport::Concern

	included do
		has_many :addresses, as: :addressable
	end
end
