json.extract! @expense, :id, :date, :category, :provider, :amount, :comments
json.payer do
  json.id @expense.payer.id
  json.name @expense.payer.name
end
json.members do
  json.array!(@expense.members) do |member|
    json.partial! 'user', user: member
  end
end
