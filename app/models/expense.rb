class Expense
  include Mongoid::Document
  field :date, type: Date
  field :category, type: String
  field :provider, type: String
  field :amount, type: Float
  field :payer, type: String
  field :members, type: Array
  field :comments, type: String

  index members: 1
end
