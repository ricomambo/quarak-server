json.array!(@balances) do |balance|
  json.project do
    json.id balance.project.id
    json.name balance.project.title
  end
  json.extract! balance, :expenses, :payments, :credits, :debits, :balance
end
