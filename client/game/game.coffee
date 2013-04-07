window.Games = new Meteor.Collection('games')

Template.game.game = () ->
  Games.findOne
    _id: Session.get('game_id')

Template.newGame.events =
  'click button': (e) ->
    id = Games.insert
      value: 10
      players: []

    Meteor.Router.to('/game/' + id)

window.GameModel =
  addPlayer: (user_id) ->
    game = Games.findOne
      _id: Session.get('game_id')
      players:
        $not: user_id

    if game?
      Games.update
        _id: Session.get('game_id')
      ,
        $push:
          players: user_id

