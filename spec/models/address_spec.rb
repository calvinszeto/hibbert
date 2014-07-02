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

require 'rails_helper'

RSpec.describe Address, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
