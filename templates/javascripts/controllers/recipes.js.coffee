app.controller 'PopularRecipesController', ($scope, $http, Recipe) ->
  page = 0
  loading = false

  $scope.loadMore = () ->
    return if loading
    loading = true
    $http.get("/api/feeds/show.json?page=#{++page}").success (data) ->
      new_recipes = _.map data, (d) -> new Recipe(d)
      $scope.recipes = ($scope.recipes || []).concat new_recipes
      loading = false if new_recipes.length == 20

  $scope.loadMore()

app.controller 'RecipeDetailController', ($scope, $http, $routeParams, Recipe) ->
  $http.get("/api/recipes/" + $routeParams.recipeId + ".json").success (data) ->
    $scope.recipe = new Recipe(data)
