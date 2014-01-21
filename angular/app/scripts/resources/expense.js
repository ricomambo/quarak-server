App.factory('Expense', ['$resource', function ($resource) {
  return $resource('/api/expenses/:id', {
    id: '@id'
  })
}])