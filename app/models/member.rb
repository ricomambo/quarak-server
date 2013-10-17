class Member < ActiveRecord::Base
  has_and_belongs_to_many :expenses
  has_many :payments, :class_name => 'Expense', :foreign_key => 'payer_id'

  validates_presence_of :name
  validates_uniqueness_of :name
end
