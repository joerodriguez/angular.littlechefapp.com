window.app = angular.module("littlechef", ['ngResource']).config ($routeProvider) ->
  $routeProvider.when("/account",
    templateUrl: "views/account.html"
    controller: AccountController
  ).when("/recipes/:recipeId",
    templateUrl: "views/recipes/detail.html"
    controller: RecipeDetailController
  ).when("/search/*",
    templateUrl: "views/recipes/search.html"
    controller: SearchController
  ).when("/popular",
    templateUrl: "views/recipes/popular.html"
    controller: RecipesListController
  ).when("/shopping-list",
    templateUrl: "views/shopping_list.html"
    controller: ShoppingListController
  ).when("/favorites",
    templateUrl: "views/recipes/favorites.html"
    controller: FavoritesController
  ).otherwise redirectTo: "/popular"

