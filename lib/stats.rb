class Stats

  def self.get_balances(project)
    if $redis.get("project:#{project.id}:balances")
      balances = JSON.parse($redis.get("project:#{project.id}:balances"))
    else
      balances = Stats.generate_balances(project)
    end
    balances
  end

  def self.generate_balances(project)
    expenses = Hash[ActiveRecord::Base.connection.exec_query("
      SELECT users.id, sum(expenses.amount / (select count(*) from expenses_users where expense_id = expenses.id))
      FROM expenses
      INNER JOIN expenses_users ON expenses_users.expense_id = expenses.id
      INNER JOIN users ON users.id = expenses_users.user_id
      WHERE expenses.project_id = #{project.id}
      GROUP BY users.id;
    ").rows]
    payments = Hash[ActiveRecord::Base.connection.exec_query("
      SELECT payer_id, sum(expenses.amount)
      FROM expenses WHERE expenses.project_id = #{project.id}
      GROUP BY payer_id;
    ").rows]
    paid_settlements = Hash[ActiveRecord::Base.connection.exec_query(
      "SELECT payer_id, sum(amount)
      FROM settlements
      WHERE project_id = #{project.id}
      GROUP BY payer_id;
    ").rows]
    received_settlements = Hash[ActiveRecord::Base.connection.exec_query(
      "SELECT payee_id, sum(amount)
      FROM settlements
      WHERE project_id = #{project.id}
      GROUP BY payee_id;
    ").rows]
    balances = {}
    project.members.each do |member|
      member_id = member.id.to_s
      balances[member_id] = {
        :expenses => expenses[member_id].to_f,
        :payments => payments[member_id].to_f,
        :paid_settlements => paid_settlements[member_id].to_f,
        :received_settlements => received_settlements[member_id].to_f
      }
      balances[member_id][:balance] = balances[member_id][:payments] - balances[member_id][:expenses] + balances[member_id][:paid_settlements] - balances[member_id][:received_settlements]
    end
    $redis.set("project:#{project.id}:balances", balances.to_json)
    return balances
  end
end
