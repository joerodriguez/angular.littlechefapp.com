app.factory 'Recipe', ($resource) ->

  res = $resource '/api/recipes/:id', { id: '@id' },
    index: { method: 'GET', isArray: true }

  _.extend res.prototype,
    app_url: ->
      "#/recipes/#{@id}-#{@title.replace(/[^A-Za-z0-9]/g, '-').toLowerCase()}"

    thumb_url: ->
      @uploads?[0]?.thumb_url || "http://www.littlechefapp.com/assets/recipe_photo_placeholder.gif"

    ingredients: ->
      _.flatten _.pluck(@sections, 'ingredient_sections')

    instructions: ->
      @procedures[0]?.description.split '.'

  res

