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

class RecommendationGroup < ActiveRecord::Base
  belongs_to :source
end