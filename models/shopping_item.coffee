app.factory 'ShoppingItem', ($resource) ->

  $resource '/api/shopping_items/:id', {},
    index: { method: 'GET', isArray: true }
