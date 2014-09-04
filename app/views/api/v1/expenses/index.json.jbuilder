json.array!(@expenses) do |expense|
  json.extract! expense, :id, :project_id, :date, :category, :provider, :amount, :comments
  json.payer do
    json.partial! 'user', user: expense.payer
  end
  json.members do
    json.array!(expense.members) do |member|
      json.partial! 'user', user: member
    end
  end
end
