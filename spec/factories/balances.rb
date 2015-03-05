# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :balance do
    project nil
    user nil
    expenses "9.99"
    payments "9.99"
    paid_settlements "9.99"
    received_settlements "9.99"
  end
end
