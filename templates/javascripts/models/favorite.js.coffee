app.factory 'Favorite', ($resource, $http, $q, Recipe) ->

  data = 
    favorites: []
    recipes: []

  resource = $resource '/api/bookmarks/:id', {}

  $http.get("/api/bookmarks.json").success (res) ->
    data.favorites = res.bookmarks
    data.recipes = _.map res.recipes, (r) -> new Recipe(r)

  {

    recipes: ->
      data.recipes

    is: (recipe) ->
      return false unless recipe
      _.find data.favorites, (f) -> f.recipe_id == recipe.id

    remove: (recipe) ->
      f = _.find(data.favorites, (f) -> f.recipe_id == recipe.id)
      data.favorites = _.without data.favorites, f
      data.recipes = _.without data.recipes, recipe
      (new resource).$delete(id: f.id)

    add: (recipe) ->
      f = new resource recipe_id: recipe.id
      f.$save()
      data.favorites.push f
      data.recipes.push recipe
  }
