FactoryGirl.define do
  factory :settlement do
    payer { create(:user) }
    payee { create(:user) }
    project { create(:project) }
    amount { 13.30 }
  end
end

