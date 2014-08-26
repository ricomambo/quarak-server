class Project < ActiveRecord::Base
  has_many :expenses, inverse_of: :project
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :projects

  validates :title, :members, presence: true

  def to_s
    "Project ##{self.id}"
  end

  def balance
    self.members.each do |member|
      member.expenses_amount = 0
      self.expenses.joins(:members).where("users.id = ?", member.id).each do |expense|
        member.expenses_amount += expense.amount / expense.members.count
      end
      member.payments_amount = self.expenses.where("payer_id = ?", member.id).sum(:amount)
      member.balance = member.payments_amount - member.expenses_amount
    end
    self.members
  end
end
