class RemoveTitleFromExpenses < ActiveRecord::Migration
  def change
    remove_column :expenses, :title, :string
  end
end
