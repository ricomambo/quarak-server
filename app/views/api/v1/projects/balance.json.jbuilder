json.array!(@balances) do |balance|
  json.member do
    json.partial! 'user', user: balance.user
  end
  json.extract! balance, :expenses, :payments, :paid_settlements, :received_settlements, :balance
end
