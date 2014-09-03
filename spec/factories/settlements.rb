# == Schema Information
#
# Table name: settlements
#
#  id         :integer          not null, primary key
#  project_id :integer
#  payer_id   :integer
#  payee_id   :integer
#  amount     :decimal(8, 2)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :settlement do
    payer { create(:user) }
    payee { create(:user) }
    project { create(:project) }
    amount { 13.30 }
  end
end

