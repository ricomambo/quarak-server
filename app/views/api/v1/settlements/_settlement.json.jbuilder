json.set! :id, settlement.id
json.payer {
  json.partial! 'user', user: settlement.payer
}
json.payee {
  json.partial! 'user', user: settlement.payee, as: :payee
}
json.amount settlement.amount
