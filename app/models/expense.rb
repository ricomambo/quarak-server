class Expense < ActiveRecord::Base
  belongs_to :payer, :class_name => 'Member', :foreign_key => 'payer_id'
  has_and_belongs_to_many :members

end
