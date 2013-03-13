app.factory 'Recipe', ($resource, $http) ->

  res = $resource '/api/recipes/:id', { id: '@id' },
    index: { method: 'GET', isArray: true }

  data = 
    progresses: []

  $http.get('/api/progresses.json').success (res) ->
    data.progresses = res


  _.extend res.prototype,
    app_url: ->
      "#/recipes/#{@id}-#{@title.replace(/[^A-Za-z0-9]/g, '-').toLowerCase()}"

    thumb_url: ->
      @uploads?[0]?.thumb_url || "http://www.littlechefapp.com/assets/recipe_photo_placeholder.gif"

    ingredients: ->
      _.flatten _.pluck(@sections, 'ingredient_sections')

    instructions: ->
      @procedures[0]?.description.split '.'

    progress: ->
      _.find data.progresses, (p) => p.recipe_id == @id

    setProgress: (step) ->
      p = @progress()
      attrs = { recipe_id: @id, step: step }
      if p
        p.step = step
      else
        data.progresses.push attrs

      $http.post('/api/progresses.json', progress: attrs)

  res

