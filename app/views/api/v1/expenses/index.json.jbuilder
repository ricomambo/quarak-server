json.array!(@expenses) do |expense|
  json.extract! expense, :id, :project_id, :date, :category, :provider, :amount, :comments
  json.payer do
    json.id expense.payer.id
    json.name expense.payer.name
  end
  json.members do
    json.array!(expense.members) do |member|
      json.id member.id
      json.name member.name
    end
  end
end
