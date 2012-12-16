class Teamwork.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults:
    name: null
    text: null
    end: null

class Teamwork.Collections.TasksCollection extends Backbone.Collection
  model: Teamwork.Models.Task
  url: '/tasks'
