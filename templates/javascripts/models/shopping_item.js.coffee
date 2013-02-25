app.factory 'ShoppingItem', ($resource) ->

  $resource '/api/shopping_items/:id', { id: '@id' },
    index: { method: 'GET', isArray: true }
    update: { method: 'PUT' }
