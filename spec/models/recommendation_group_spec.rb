# == Schema Information
#
# Table name: recommendation_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  website    :string(255)
#  source_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe RecommendationGroup, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
