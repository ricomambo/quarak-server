class Balance
  attr_reader :project, :user

  def initialize(project, user)
    @project = project
    @user = user
  end

  def expenses
    if @expenses.nil?
      @expenses = 0
      @project.expenses.joins(:members).where("users.id = ?", @user.id).each do |expense|
        @expenses += expense.amount / expense.members.count
      end
    end
    @expenses
  end

  def payments
    @payments ||= @project.expenses.where("payer_id = ?", @user.id).sum(:amount)
  end

  def paid_settlements
    @paid_settlements ||= @project.settlements.where("payer_id = ?", @user.id).sum(:amount)
  end

  def received_settlements
    @received_settlements ||= @project.settlements.where("payee_id = ?", @user.id).sum(:amount)
  end

  def balance
    payments - expenses + paid_settlements - received_settlements
  end
end
