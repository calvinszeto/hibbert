# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  admin                  :boolean
#  username               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :user_preference, dependent: :destroy
	before_create :create_user_preference

	delegate :no_show_sources,
		:no_show_restaurants,
		:tried_restaurants,
		:add_no_show_source,
		:remove_no_show_source,
		:add_no_show_restaurant,
		:remove_no_show_restaurant,
		:add_tried_restaurant,
		:remove_tried_restaurant,
		:to => :user_preference

	private
		def create_user_preference
			self.user_preference ||= UserPreference.create
		end
end
