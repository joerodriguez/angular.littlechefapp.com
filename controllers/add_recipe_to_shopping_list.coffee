app.controller 'AddRecipeToShoppingListController', ($scope, ShoppingItem) ->
  @setRecipe = (recipe) ->
    $scope.recipe = recipe
    $scope.items = _.map recipe.ingredients(), (i) ->
      newIng = _.clone(i)
      newIng.checked = true
      newIng
    $scope.$digest()

  $scope.submit = ->
    items_to_add = _.select $scope.items, (i) -> i.checked
    _.each items_to_add, (item) ->
      c = new ShoppingItem name: item.name, recipe_id: $scope.recipe.id
      c.$save()
