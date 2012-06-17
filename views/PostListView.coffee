module 'Views'

Views.PostListView = class extends Backbone.View
  tagName: "ul"
  el: Config.Options.contentContainer
  initialize: ->
    @collection.bind "reset", @render

  render: (eventName) =>
    @$el.html ""
    @model.forEach (post) -> Utils.EventBus.trigger "blog:listReady", {el:@el,model:post}