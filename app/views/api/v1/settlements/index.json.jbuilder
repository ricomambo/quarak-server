json.settlements do
  json.array! @settlements do |settlement|
    json.partial! 'settlement', settlement: settlement
  end
end
