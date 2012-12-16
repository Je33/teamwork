Teamwork.Views.Tasks ||= {}

class Teamwork.Views.Tasks.ShowView extends Backbone.View
  template: JST["backbone/templates/tasks/show"]

  initialize: ->
    _t = this
    WS.bind 'update_task', (data) ->
      _t.edit data
    WS.bind 'destroy_task', (data) ->
      if data.id == _t.model.id
        alert "Task has been deleted"
        location.hash = "#/index"

  edit: (data) ->
    if data.id == @model.id
      @model.set data
      this.render()

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
