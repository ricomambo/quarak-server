class ExpensesMembers < ActiveRecord::Migration
  def change
    create_join_table :expenses, :members
  end
end
