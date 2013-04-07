Meteor.Router.add
  '/': 'index'
  '/game/:game_id': (game_id) ->
    Session.set('game_id', game_id)
    return 'game'

  '/game/:game_id/controller': (game_id) ->
    Session.set('game_id', game_id)
    return 'controller'

  '/about': 'about'

  '*': 'not_found'
