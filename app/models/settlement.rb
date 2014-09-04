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

class Settlement < ActiveRecord::Base
  belongs_to :project
  belongs_to :payee, class_name: 'User', inverse_of: :received_settlements
  belongs_to :payer, class_name: 'User', inverse_of: :payed_settlements

  validates_presence_of :project, :amount, :payee, :payer
end
