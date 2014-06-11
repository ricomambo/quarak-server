class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :project_id
      t.date :date
      t.string :category
      t.string :provider
      t.float :amount
      t.integer :payer_id
      t.text :comments

      t.timestamps
    end
  end
end
