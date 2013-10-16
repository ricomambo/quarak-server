class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.string :category
      t.string :provider
      t.text :comments
      t.decimal :amount
      t.date :date
      t.references :member, index: true

      t.timestamps
    end
  end
end
