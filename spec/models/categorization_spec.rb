# == Schema Information
#
# Table name: categorizations
#
#  id            :integer          not null, primary key
#  category_id   :integer
#  restaurant_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe Categorization, :type => :model do
end
