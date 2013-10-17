class RenameMemberIdToPayerIdInExpenses < ActiveRecord::Migration
  def change 
    rename_column :expenses, :member_id, :payer_id
  end
end
