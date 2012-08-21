class window.SensuEvents.EventView extends Backbone.View
  id: "event"

  render: ->
    template = JST['event_view']( @model.toJSON() )
    $(@el).html(template)
    this
