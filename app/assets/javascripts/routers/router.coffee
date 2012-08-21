class SensuEvents.Router extends Backbone.Router

  routes:
    "": "index"

  index: ->
    event = new SensuEvents.Event()
    view = new SensuEvents.EventView(model:event)
    $('body').append(view.render().el)
