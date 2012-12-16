Teamwork.Views.Tasks ||= {}

class Teamwork.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]

  initialize: ->
    _t = this
    WS.bind 'update_task', (data) ->
      _t.edit data
    WS.bind 'destroy_task', (data) ->
      if data.id == _t.model.id
        _t.destroy()

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  edit: (data) ->
    if data.id == @model.id
      @model.set data
      this.render()

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
