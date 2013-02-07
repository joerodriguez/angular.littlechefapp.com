window.FavoritesController = ($scope, $http, Favorite) ->
  $scope.recipes = -> Favorite.recipes()
