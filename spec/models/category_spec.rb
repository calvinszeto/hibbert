# == Schema Information
#
# Table name: categories
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  categorizations_count :integer          default(0)
#

require 'rails_helper'

RSpec.describe Category, :type => :model do
end
