# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category    :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

require 'rails_helper'

RSpec.describe Source, :type => :model do
	before(:each) do
		@source = FactoryGirl.create(:source)
	end
end
