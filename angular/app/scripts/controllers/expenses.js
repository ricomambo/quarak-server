App.controller('ExpensesCtrl', ['$scope', 'Expense', function ($scope, Expense) {
  $scope.expenses = Expense.query();
}]);
