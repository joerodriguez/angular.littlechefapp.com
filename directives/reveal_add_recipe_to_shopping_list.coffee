app.directive 'revealAddRecipeToShoppingList', () ->
  scope:
    recipeToAdd: "=recipe"
  link: (scope, element) ->
    $(element).click ->
      el = angular.element '.shopping-list-modal'
      el.controller().setRecipe scope.recipeToAdd
      el.reveal()

