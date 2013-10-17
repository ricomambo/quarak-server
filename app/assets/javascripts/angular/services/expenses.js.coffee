App.factory 'Expense', ['$resource', ($resource) ->
  $resource '/expenses/:id', id: '@id'
]