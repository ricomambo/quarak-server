json.array!(@users) do |user|
  json.extract! user, :id, :name, :expenses_amount, :payments_amount, :balance
end
