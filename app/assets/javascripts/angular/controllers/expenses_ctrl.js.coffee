App.controller 'ExpensesCtrl', ['$scope', 'Expense', ($scope, Expense) ->
  $scope.expenses = Expense.query()
]