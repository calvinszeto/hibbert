# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  image        :string(255)
#  imageable_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Image, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end