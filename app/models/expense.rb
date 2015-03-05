# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  project_id :integer
#  date       :date
#  category   :string(255)
#  provider   :string(255)
#  amount     :decimal(, )
#  payer_id   :integer
#  comments   :text
#  created_at :datetime
#  updated_at :datetime
#

class Expense < ActiveRecord::Base
  belongs_to :project, inverse_of: :expenses
  belongs_to :payer, class_name: "User", foreign_key: "payer_id", inverse_of: :payed_expenses
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :expenses

  validates :project, :date, :category, :amount, :payer, :members, presence: true

  after_save :reset_balances
  after_destroy :reset_balances

  def to_s
    "Expense ##{self.id}"
  end

  def self.by_month
    group_by_month(:date).sum(:amount)
  end

  def self.by_category
    group(:category).sum(:amount)
  end

  private

    def reset_balances
      project.balances.destroy_all
    end

end
