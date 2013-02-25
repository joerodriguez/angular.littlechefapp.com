app.directive 'authorized', (User) ->
  link: (scope, element) ->
    $(element).click (evt) ->
      unless User.current()
        el = angular.element '.authorization-modal'
        el.reveal()
        evt.stopImmediatePropagation()
        evt.preventDefault()

