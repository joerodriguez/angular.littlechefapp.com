app.controller 'RecipeDetailController', ($scope, $http, $routeParams, Recipe) ->
  $http.get("/api/recipes/" + $routeParams.recipeId + ".json").success (data) ->
    $scope.recipe = new Recipe(data)
    $scope.progress_step = $scope.recipe.progress()?.step

  $scope.setProgress = (step) ->
    $scope.recipe.setProgress step
    $scope.progress_step = step
