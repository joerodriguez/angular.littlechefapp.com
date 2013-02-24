app.controller 'RecipesListController', ($scope, $http, Recipe) ->
  $http.get("/api/feeds/show.json").success (data) ->
    $scope.recipes = _.map data, (d) -> new Recipe(d)

app.controller 'RecipeDetailController', ($scope, $http, $routeParams, Recipe) ->
  $http.get("/api/recipes/" + $routeParams.recipeId + ".json").success (data) ->
    $scope.recipe = new Recipe(data)
