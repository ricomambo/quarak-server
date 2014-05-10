json.array!(@expenses) do |expense|
  json.extract! expense, :id, :date, :category, :provider, :amount, :payer, :comments
end
