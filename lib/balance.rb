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
    @payments = @project.expenses.where("payer_id = ?", @user.id).sum(:amount) if @payments.nil?
    @payments
  end

  def credits
    @credits = @project.settlements.where("payer_id = ?", @user.id).sum(:amount) if @credits.nil?
    @credits
  end

  def debits
    @debits = @project.settlements.where("payee_id = ?", @user.id).sum(:amount) if @debits.nil?
    @debits
  end

  def balance
    @payments - @expenses + @credits - @debits
  end
end
