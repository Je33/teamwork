Teamwork.Views.Tasks ||= {}

class Teamwork.Views.Tasks.EditView extends Backbone.View
  template : JST["backbone/templates/tasks/edit"]

  initialize: ->
    _t = this
    WS.bind 'update_task', (data) ->
      _t.edit data
    WS.bind 'destroy_task', (data) ->
      if data.id == _t.model.id
        alert "Task has been deleted"
        location.hash = "#/index"

  events :
    "submit #edit-task" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (task) =>
        @model = task
        window.location.hash = "/#{@model.id}"
    )

  edit: (data) ->
    if data.id == @model.id
      @model.set data
      this.render()

  render : ->
    $(@el).html(@template(@model.toJSON()))

    this.$("form").backboneLink(@model)

    return this
