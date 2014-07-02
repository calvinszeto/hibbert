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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    image "MyString"
  end
end
