window.Games = new Meteor.Collection('games')

Meteor.Router.add
  '/': 'index'
  '/game/:game_id': (game_id) ->
    console.log game_id
    Session.set('game_id', game_id)
    return 'game'

  '/game/:game_id/controller': (game_id) ->
    console.log 'controller game id', game_id
    return 'controller'

  '/about': 'about'

  '*': 'not_found'

Template.menu.games = ->
  Games.find {}

Template.game.game = () ->
  Games.findOne
    _id: Session.get('game_id')

Template.controller.game = () ->
  Games.findOne
    _id: Session.get('game_id')

Meteor.startup ->
  # Games.insert
  #   value: 10
