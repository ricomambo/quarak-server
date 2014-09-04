# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :project do
    title { Faker::Company.name }
    members { create_list(:user, 2,) }
  end
end

