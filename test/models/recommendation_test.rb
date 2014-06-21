# == Schema Information
#
# Table name: recommendations
#
#  id               :integer          not null, primary key
#  restaurant_id    :integer
#  source_id        :integer
#  date_recommended :date
#  website          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
