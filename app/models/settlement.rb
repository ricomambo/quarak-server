class Settlement < ActiveRecord::Base
  belongs_to :project
  belongs_to :payee, class_name: 'User', inverse_of: :received_settlements
  belongs_to :payer, class_name: 'User', inverse_of: :payed_settlements

  validates_presence_of :project, :amount, :payee, :payer
end
