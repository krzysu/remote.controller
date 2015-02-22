window.Games = new Meteor.Collection('games')

Template.game.game = () ->
  Games.findOne
    _id: Session.get('game_id')

Template.newGame.events =
  'click button': (e) ->
    id = Games.insert
      value: 10
      players: []

    Router.go('/game/' + id)

window.GameModel =
  addPlayer: (user_id) ->
    unless @doesPlayerBelongToGame(user_id, Session.get('game_id'))
      Games.update
        _id: Session.get('game_id')
      ,
        $push:
          players: user_id

  doesPlayerBelongToGame: (user_id, game_id) ->
    game = Games.findOne
      _id: game_id
      players:
        $not: user_id

    if game?
      return false
    else
      return true

