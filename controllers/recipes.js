// Generated by CoffeeScript 1.4.0
(function() {

  window.RecipesListController = function($scope, $http, Recipe) {
    return $http.get("/api/feeds/show.json").success(function(data) {
      return $scope.recipes = _.map(data, function(d) {
        return new Recipe(d);
      });
    });
  };

  window.RecipeDetailController = function($scope, $http, $routeParams, Recipe) {
    return $http.get("/api/recipes/" + $routeParams.recipeId + ".json").success(function(data) {
      return $scope.recipe = new Recipe(data);
    });
  };

}).call(this);
