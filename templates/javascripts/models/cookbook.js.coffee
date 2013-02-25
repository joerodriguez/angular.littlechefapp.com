app.factory 'Cookbook', ($resource) ->
  $resource '/api/cookbooks/:id', { id: '@id' }
