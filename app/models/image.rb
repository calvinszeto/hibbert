# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  image          :string(255)
#  imageable_id   :integer
#  created_at     :datetime
#  updated_at     :datetime
#  imageable_type :integer
#

class Image < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
