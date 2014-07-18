# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  image          :string(255)
#  imageable_id   :integer
#  created_at     :datetime
#  updated_at     :datetime
#  imageable_type :integer
#

require 'rails_helper'

RSpec.describe Image, :type => :model do
end
