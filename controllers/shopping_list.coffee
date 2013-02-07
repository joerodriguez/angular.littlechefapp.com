window.ShoppingListController = ($scope, $http, ShoppingItem) ->

  ShoppingItem.query (data) ->
    $scope.items = data

  $scope.create = (name) ->
    return unless name.match(/[^ ]+/)
    c = new ShoppingItem name: name
    c.$save()
    $scope.items.push c
    $scope.newItemName = ''

  $scope.removeAll = ->
    console.log "remove all"

  $scope.removeSelected = ->
    res = _.groupBy $scope.items, (i) -> !!i.checked
    $scope.items = res.false
    _.each res.true, (i) -> i.$delete id: i.id
