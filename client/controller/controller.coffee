
Template.controller.game = () ->
  Games.findOne
    _id: Session.get('game_id')

Template.controller.events =
  'click .value-up': (e) ->
    Games.update
      _id: Session.get('game_id')
    ,
      $inc:
        value: 1

  'click .value-down': (e) ->
    Games.update
      _id: Session.get('game_id')
    ,
      $inc:
        value: -1

Template.controller.rendered = ->
  GameModel.addPlayer Meteor.userId()

