json.array!(@balances) do |user_id, balance|
  json.member do
    json.partial! 'user', user: User.find(user_id)
  end
  json.balance balance["expenses"]
  json.payments balance["payments"]
  json.paid_settlements balance["paid_settlements"]
  json.received_settlements balance["received_settlements"]
  json.balance balance["balance"]
end
