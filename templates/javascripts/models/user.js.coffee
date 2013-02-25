app.factory 'User', ($http) ->
  data = current: null

  $http.get('/api/account.json').success (res) ->
    data.current = res.user

  current: -> data.current
