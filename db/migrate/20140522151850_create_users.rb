class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email, :null => false, :default => ""
      t.string :password, :null => false, :default => ""
      t.string :name
      t.string :token

      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end
