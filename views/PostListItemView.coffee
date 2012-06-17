module 'Views'

Views.PostListItemView = class extends Backbone.View
  tagName: "li"
  templateName: "post_list_item"
  initialize: ->
    @template = Utils.tpl.get(@templateName)
    @model.bind "reset", @render

  render: =>
    $@el.html Mustache.render(@template, @model.toJSON())