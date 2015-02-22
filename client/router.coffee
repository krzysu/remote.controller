
Router.route '/', ->
  @render 'index'

Router.route '/game/:game_id', ->
  Session.set('game_id', @params.game_id)
  @render 'game'

Router.route '/game/:game_id/controller', ->
  Session.set('game_id', @params.game_id)
  @render 'controller'

Router.route '/about', ->
  @render 'about'

