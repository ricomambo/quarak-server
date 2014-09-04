class ChangeAmountTypeInExpenses < ActiveRecord::Migration
  def change
    change_column :expenses, :amount, :decimal
  end
end
