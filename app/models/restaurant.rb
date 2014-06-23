# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  recommendations_count :integer          default(0)
#

class Restaurant < ActiveRecord::Base
has_many :recommendations, dependent: :destroy
has_many :sources, through: :recommendations
end
