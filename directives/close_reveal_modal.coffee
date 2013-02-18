app.directive 'closeRevealModal', () ->
  link: (scope, element, attrs, ctrl) ->
    $(element).click ->
      element.closest('.reveal-modal').trigger 'reveal:close'

