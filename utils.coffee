window.module = (name) ->
  window[name] = window[name] or {}

module 'Utils'

Utils.EventBus = class extends Backbone.Events

Utils.tpl =
  templates: {}
  templatePath: 'templates/'
  templateExtension: '.html'
  loadTemplates: (templates, callback) =>
    loadTemplate = (index) ->
      template = templates[index]
      $.get @templatePath + template + @templateExtension, (data) ->
        @templates[name] = data
        index++
        if index < names.length
          loadTemplate index
        else
        callback()
  
      loadTemplate 0
  
  get: (name) ->
    @templates[name]
  