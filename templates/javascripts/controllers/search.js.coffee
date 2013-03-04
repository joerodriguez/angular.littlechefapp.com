app.controller 'SearchController', ($scope, $routeParams, $http, Recipe) ->
  page = 0
  loading = false
  update = ->
    return if loading
    loading = true
    $scope.query = $routeParams.q
    $http.get("/api/search?q=#{$scope.query}&page=#{++page}").success (res) ->
      new_recipes = _.map res.recipes, (r) -> new Recipe(r)
      $scope.recipes = ($scope.recipes || []).concat new_recipes
      $scope.total = res.total_entries
      loading = false if new_recipes.length == 20

   $scope.$on '$routeUpdate', update

   update()

   $scope.loadMore = update
