App.controller 'MembersCtrl', ['$scope', 'Member', ($scope, Member) ->
  $scope.members = Member.query()
]