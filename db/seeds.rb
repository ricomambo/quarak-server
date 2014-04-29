# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

expenses = Expense.create([
  {date: "2014-03-25", category: "Supermarket", provider: "Walmart", amount: 745.24, payer: 1, comments: "Sample expense"},
  {date: "2014-03-26", category: "Rent", provider: "Mr. Magoo", amount: 1400, payer: 2, comments: "Another expense"},
  {date: "2014-04-27", category: "Supermarket", provider: "Carrefour", amount: 425.41, payer: 1, comments: "The last expense"}
])
