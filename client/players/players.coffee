Template.players.players = ->

  Games.findOne
    _id: Session.get('game_id')
  ,
    transform: (obj) ->
      _.each obj.players, (item, index) ->
        player = Meteor.users.findOne item
        obj.players[index] = player

      console.log obj
      return obj.players
