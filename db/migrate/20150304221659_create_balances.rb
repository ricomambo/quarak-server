class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.decimal :expenses
      t.decimal :payments
      t.decimal :paid_settlements
      t.decimal :received_settlements
      t.decimal :balance

      t.timestamps
    end
  end
end
