app.controller 'ApplicationController', ($scope, $window, Favorite, User) ->
  $scope.favorite = (recipe) ->
    Favorite.add recipe

  $scope.unfavorite = (recipe) ->
    Favorite.remove recipe

  $scope.isFavorite = (recipe) ->
    Favorite.is recipe

  $scope.search = (q) ->
    $window.location.hash = "#/search?q=#{q}"

  $scope.user = ->
    User.current()
