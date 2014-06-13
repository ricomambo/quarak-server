class Expense < ActiveRecord::Base
  belongs_to :project, inverse_of: :expenses
  belongs_to :payer, class_name: "User", foreign_key: "payer_id", inverse_of: :payments
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :expenses

  validates :project, :date, :category, :amount, :payer, :members, presence: true

end
