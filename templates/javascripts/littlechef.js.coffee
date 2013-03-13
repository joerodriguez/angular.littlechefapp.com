window.app = angular.module("littlechef", ['ngResource', 'infinite-scroll']).config ($routeProvider) ->
  $routeProvider.when("/recipes/:recipeId",
    templateUrl: "views/recipes/detail.html"
    controller: 'RecipeDetailController'
  ).when("/popular",
    templateUrl: "views/recipes/popular.html"
    controller: 'PopularRecipesController'
  ).when("/shopping-list",
    templateUrl: "views/shopping_list.html"
    controller: 'ShoppingListController'
  ).when("/favorites",
    templateUrl: "views/recipes/favorites.html"
    controller: 'FavoritesController'
  ).when("/search",
    templateUrl: "views/recipes/search.html"
    controller: 'SearchController'
    reloadOnSearch: false
  ).otherwise redirectTo: "/popular"

