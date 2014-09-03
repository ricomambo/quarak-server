# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  project_id :integer
#  date       :date
#  category   :string(255)
#  provider   :string(255)
#  amount     :float
#  payer_id   :integer
#  comments   :text
#  created_at :datetime
#  updated_at :datetime
#

class Expense < ActiveRecord::Base
  belongs_to :project, inverse_of: :expenses
  belongs_to :payer, class_name: "User", foreign_key: "payer_id", inverse_of: :payments
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :expenses

  validates :project, :date, :category, :amount, :payer, :members, presence: true

  def to_s
    "Expense ##{self.id}"
  end

end
