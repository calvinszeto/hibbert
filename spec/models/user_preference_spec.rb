# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  recent_addresses    :string(255)
#  recent_categories   :string(255)
#  no_show_sources     :string(255)
#  no_show_restaurants :string(255)
#  tried_restaurants   :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'rails_helper'

RSpec.describe UserPreference, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
