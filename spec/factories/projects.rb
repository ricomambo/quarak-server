FactoryGirl.define do
  factory :project do
    title { Faker::Company.name }
    members { create_list(:user, 2,) }
  end
end

