app.filter 'squish', ->
  (stringInput) ->
    stringInput.replace(/^\s\s*/, '').replace /\s\s*$/, ''
