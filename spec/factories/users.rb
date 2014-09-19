# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      default(""), not null
#  name            :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  active          :boolean          default(TRUE)
#  password_digest :string(255)
#

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    password { Faker::Internet.password }
  end
end

