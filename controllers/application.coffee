window.ApplicationController = ($scope, Favorite) ->
  $scope.favorite = (recipe) ->
    Favorite.add recipe

  $scope.unfavorite = (recipe) ->
    Favorite.remove recipe

  $scope.isFavorite = (recipe) ->
    Favorite.is recipe
