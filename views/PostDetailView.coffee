module 'Views'

Views.PostDetailView = class extends Backbone.View.extend
  templateName: "post_detail"
  initialize: ->
    @template = Utils.tpl.get(@templateName)
    @model.bind "reset", @render
    @model.bind "change", @render
    # if it has a title, it was plucked from a populated Collection and won't fire the 'reset' event. So render away.
    @render()  if @model.has("title") 

  render: =>
    $@el.html Mustache.render(@template, @model.toJSON())