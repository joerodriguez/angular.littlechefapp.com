app.controller 'AccountController', ($scope, $http) ->
  $http.get("/api/account.json").success (data) ->
    $scope.recipes = _.map data.user.recipes, (d) -> new Recipe(d)
    $scope.user = new User id: data.user.id , username: data.user.username, image_url: data.user.image_url
    $scope.cookbooks = data.user.cookbooks

