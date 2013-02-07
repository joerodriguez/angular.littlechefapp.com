// Generated by CoffeeScript 1.4.0
(function() {

  window.app = angular.module("littlechef", ['ngResource']).config(function($routeProvider) {
    return $routeProvider.when("/account", {
      templateUrl: "views/account.html",
      controller: AccountController
    }).when("/recipes/:recipeId", {
      templateUrl: "views/recipes/detail.html",
      controller: RecipeDetailController
    }).when("/search/*", {
      templateUrl: "views/recipes/search.html",
      controller: SearchController
    }).when("/popular", {
      templateUrl: "views/recipes/popular.html",
      controller: RecipesListController
    }).when("/shopping-list", {
      templateUrl: "views/shopping_list.html",
      controller: ShoppingListController
    }).when("/favorites", {
      templateUrl: "views/recipes/favorites.html",
      controller: FavoritesController
    }).otherwise({
      redirectTo: "/popular"
    });
  });

}).call(this);
