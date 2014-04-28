json.array!(@expenses) do |expense|
  json.extract! expense, :id, :date, :category, :provider, :amount, :payer, :comments
  json.url api_expense_url(expense, format: :json)
end
