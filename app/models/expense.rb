class Expense < ActiveRecord::Base
  belongs_to :project
  belongs_to :payer, class_name: "User", foreign_key: "payer_id"
  has_and_belongs_to_many :members, class_name: "User"

end
