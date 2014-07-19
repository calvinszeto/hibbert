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

class Category < ActiveRecord::Base
	has_many :restaurants, through: :categorizations
	has_many :categorizations, dependent: :destroy

	include Imageable
end
