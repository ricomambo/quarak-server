# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    email: "john@test.com",
    password: "Lennon1234",
    name: "John Lennon"
  },
  {
    email: "ringo@test.com",
    password: "Star1234",
    name: "Ringo Star"
  },
  {
    email: "george@test.com",
    password: "Harrison1234",
    name: "George Harrison"
  }
])

projects = Project.create([
  {
    title: "First Project",
    members: [users[0], users[1], users[2]]
  },
  {
    title: "Last Project",
    members: [users[1], users[2]]
  }
])

expenses = Expense.create([
  {
    project: projects.first,
    date: "2014-03-25",
    category: "Supermarket",
    provider: "Walmart",
    amount: 745.24,
    payer: users[1],
    comments: "Sample expense",
    members: [users[0], users[1], users[2]]
  },
  {
    project: projects.first,
    date: "2014-03-26",
    category: "Rent",
    provider: "Mr. Magoo",
    amount: 1400,
    payer: users[1],
    comments: "Another expense",
    members: [users[1], users[2]]
  },
  {
    project: projects.first,
    date: "2014-04-27",
    category: "Supermarket",
    provider: "Carrefour",
    amount: 425.41,
    payer: users[2],
    comments: "The last expense",
    members: [users[0], users[2]]
  },
  {
    project: projects.last,
    date: "2014-05-25",
    category: "Supermarket",
    provider: "Carrefour",
    amount: 1745.24,
    payer: users[1],
    comments: "Sample expense",
    members: [users[1], users[2]]
  },
  {
    project: projects.last,
    date: "2014-05-26",
    category: "Misc",
    provider: "Mystic Man",
    amount: 400,
    payer: users[2],
    comments: "Another expense",
    members: [users[1], users[2]]
  },
  {
    project: projects.last,
    date: "2014-05-27",
    category: "Supermarket",
    provider: "Carrefour",
    amount: 25.41,
    payer: users[2],
    comments: "The last expense",
    members: [users[1], users[2]]
  }
])
