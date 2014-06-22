# == Schema Information
#
# Table name: recommendations
#
#  id               :integer          not null, primary key
#  restaurant_id    :integer
#  source_id        :integer
#  date_recommended :date
#  created_at       :datetime
#  updated_at       :datetime
#

require 'rails_helper'

RSpec.describe Recommendation, :type => :model do
end
