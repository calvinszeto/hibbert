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
end
