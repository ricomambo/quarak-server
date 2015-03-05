class Balance < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  def self.generate_balance(projects=Project.all)
    projects.each do |project|
      project.balances.destroy_all
      project.members.each do |member|
        balance = project.balances.new(user: member, expenses: 0)
        project.expenses.joins(:members).where("users.id = ?", member.id).each do |expense|
          balance.expenses += expense.amount / expense.members.count
        end
        balance.payments = project.expenses.where("payer_id = ?", member.id).sum(:amount)
        balance.paid_settlements = project.settlements.where("payer_id = ?", member.id).sum(:amount)
        balance.received_settlements = project.settlements.where("payee_id = ?", member.id).sum(:amount)
        balance.balance = balance.payments - balance.expenses + balance.paid_settlements - balance.received_settlements
        balance.save
      end
    end
  end
end
