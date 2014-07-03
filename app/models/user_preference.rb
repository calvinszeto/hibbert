# == Schema Information
#
# Table name: user_preferences
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  no_show_sources     :string(255)      default([]), is an Array
#  no_show_restaurants :string(255)      default([]), is an Array
#  tried_restaurants   :string(255)      default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#

class UserPreference < ActiveRecord::Base
  belongs_to :user
end
