class Expense < ActiveRecord::Base
  belongs_to :payer, :class_name => 'Member', :foreign_key => 'member_id'
  has_and_belongs_to_many :sharers, :class_name => 'Member'
end
