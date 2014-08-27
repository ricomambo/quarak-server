class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.integer :project_id
      t.integer :payer_id
      t.integer :payee_id
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
