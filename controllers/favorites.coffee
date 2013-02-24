app.controller 'FavoritesController', ($scope, $http, Favorite) ->
  $scope.recipes = -> Favorite.recipes()
