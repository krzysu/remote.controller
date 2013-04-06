window.Games = new Meteor.Collection('games')

Template.game.game = () ->
  Games.findOne
    _id: Session.get('game_id')
