#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.WS = new WebSocketRails(location.host + "/websocket")

WS.on_open = (data) ->
  # console.log data

Backbone.sync = (method, model, options) ->
  # console.log model
  complete = (data) ->
    if options.success != undefined
      options.success(data)
  model.trigger "sync:start"
  switch method
    when "create"
      WS.trigger "tasks.create", model.attributes, (data) ->
        model.set data
        complete(model)
    when "read"
      WS.trigger "tasks.read"
    when "update"
      WS.trigger "tasks.update", model.attributes, (data) ->
        model.set data
        complete(model)
    when "delete"
      WS.trigger "tasks.destroy", model.attributes
  model.trigger "sync:end"


window.Teamwork =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}