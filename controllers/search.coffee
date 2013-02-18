app.controller 'SearchController', ($scope, $routeParams, $http, Recipe) ->
  update = ->
    $scope.query = $routeParams.q
    $http.get("/api/search?q=#{$scope.query}").success (res) ->
      $scope.recipes = _.map res.recipes, (r) -> new Recipe(r)
      $scope.total = res.total_entries

   $scope.$on '$routeUpdate', -> update()

   update()
