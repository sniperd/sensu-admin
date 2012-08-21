class window.SensuEvents
  sanity: -> true

  constructor: ->
    new SensuEvents.Router()
    Backbone.history.start()
