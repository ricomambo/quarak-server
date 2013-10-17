App.factory 'Member', ['$resource', ($resource) ->
  $resource '/members/:id', id: '@id'
]