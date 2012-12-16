Teamwork.Views.Tasks ||= {}

class Teamwork.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: () ->
    _t = this
    @options.tasks.bind('reset', @addAll)
    WS.bind 'create_task', (data) ->
      task = new Teamwork.Models.Task(data)
      _t.addOne task

  addAll: () =>
    @options.tasks.each(@addOne)

  addOne: (task) =>
    view = new Teamwork.Views.Tasks.TaskView({model : task})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(tasks: @options.tasks.toJSON() ))
    @addAll()

    return this
